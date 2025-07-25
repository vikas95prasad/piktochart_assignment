require_relative 'lib/basket'
require_relative 'lib/product_catalogue'
require_relative 'lib/delivery_calculator'
require_relative 'lib/offer_calculator'

class BasketTest
  def initialize
    @tests_run = 0
    @tests_passed = 0
  end

  def run_all_tests
    puts "Running Basket Tests..."
    puts "=" * 50

    test_basket_initialization
    test_adding_products
    test_example_baskets
    test_delivery_calculation
    test_red_widget_offer
    test_edge_cases

    puts "=" * 50
    puts "Tests completed: #{@tests_passed}/#{@tests_run} passed"

    if @tests_passed == @tests_run
      puts "All tests passed!"
    else
      puts "Some tests failed!"
      exit(1)
    end
  end

  private

  def setup_basket
    catalogue = ProductCatalogue.new
    delivery_calculator = DeliveryCalculator.new
    offer_calculator = OfferCalculator.new
    Basket.new(catalogue, delivery_calculator, offer_calculator)
  end

  def assert_equal(expected, actual, message = "")
    @tests_run += 1
    if expected.is_a?(Float) && actual.is_a?(Float)
      if (expected - actual).abs < 0.001
        @tests_passed += 1
        puts "PASS: #{message}"
      else
        puts "FAIL: #{message}"
        puts "   Expected: #{expected}"
        puts "   Actual: #{actual}"
      end
    elsif expected == actual
      @tests_passed += 1
      puts "PASS: #{message}"
    else
      puts "FAIL: #{message}"
      puts "   Expected: #{expected}"
      puts "   Actual: #{actual}"
    end
  end

  def test_basket_initialization
    basket = setup_basket
    assert_equal(0, basket.item_count, "Empty basket should have 0 items")
    assert_equal(4.95, basket.total, "Empty basket should have $4.95 total (delivery only)")
  end

  def test_adding_products
    basket = setup_basket

    result = basket.add('R01')
    assert_equal(true, result, "Should successfully add valid product")
    assert_equal(1, basket.item_count, "Basket should have 1 item after adding")

    result = basket.add('INVALID')
    assert_equal(false, result, "Should return false for invalid product code")
    assert_equal(1, basket.item_count, "Basket should still have 1 item after invalid add")
  end

  def test_example_baskets
    # Test case 1: B01, G01 = $37.85
    basket = setup_basket
    basket.add('B01')
    basket.add('G01')
    expected = 37.85
    assert_equal(expected, basket.total, "B01, G01 should total $37.85")

    # Test case 2: R01, R01 = $54.37 (rounded from $54.375)
    basket = setup_basket
    basket.add('R01')
    basket.add('R01')
    expected = 54.37
    assert_equal(expected, basket.total, "R01, R01 should total $54.37")

    # Test case 3: R01, G01 = $60.85
    basket = setup_basket
    basket.add('R01')
    basket.add('G01')
    expected = 60.85
    assert_equal(expected, basket.total, "R01, G01 should total $60.85")

    # Test case 4: B01, B01, R01, R01, R01 = $98.27 (rounded from $98.275)
    basket = setup_basket
    basket.add('B01')
    basket.add('B01')
    basket.add('R01')
    basket.add('R01')
    basket.add('R01')
    expected = 98.27
    assert_equal(expected, basket.total, "B01, B01, R01, R01, R01 should total $98.27")
  end

  def test_delivery_calculation
    basket = setup_basket

    # Test under $50 - should be $4.95 delivery
    basket.add('B01')  # $7.95
    expected_delivery = 4.95
    assert_equal(expected_delivery, basket.delivery_cost, "Under $50 should have $4.95 delivery")

    # Test under $90 - should be $2.95 delivery
    basket.clear
    basket.add('R01')  # $32.95
    basket.add('G01')  # $24.95
    expected_delivery = 2.95
    assert_equal(expected_delivery, basket.delivery_cost, "Under $90 should have $2.95 delivery")

    # Test $90 or more - should be free delivery
    basket.clear
    basket.add('R01')  # $32.95
    basket.add('R01')  # $32.95
    basket.add('R01')  # $32.95
    basket.add('G01')  # $24.95
    expected_delivery = 0.0
    assert_equal(expected_delivery, basket.delivery_cost, "$90+ should have free delivery")
  end

  def test_red_widget_offer
    basket = setup_basket

    # Test single red widget - no discount
    basket.add('R01')
    expected_discount = 0.0
    assert_equal(expected_discount, basket.discount, "Single red widget should have no discount")

    # Test two red widgets - 50% off second
    basket.add('R01')
    expected_discount = 16.48  # 50% of $32.95 rounded
    assert_equal(expected_discount, basket.discount, "Two red widgets should get 50% off second")

    # Test four red widgets - two discounts
    basket.add('R01')
    basket.add('R01')
    expected_discount = 32.95  # 50% of two widgets
    assert_equal(expected_discount, basket.discount, "Four red widgets should get two discounts")
  end

  def test_edge_cases
    basket = setup_basket

    # Test empty basket
    assert_equal(0.0, basket.subtotal, "Empty basket subtotal should be $0")
    assert_equal(0.0, basket.discount, "Empty basket discount should be $0")
    assert_equal(4.95, basket.delivery_cost, "Empty basket should still have minimum delivery")

    # Test basket summary
    basket.add('R01')
    basket.add('G01')
    summary = basket.summary
    assert_equal(['R01', 'G01'], summary[:items], "Summary should include item codes")
    assert_equal(57.9, summary[:subtotal], "Summary subtotal should be correct")
  end
end

BasketTest.new.run_all_tests
