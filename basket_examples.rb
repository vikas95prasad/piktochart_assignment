require_relative 'lib/basket'
require_relative 'lib/product_catalogue'
require_relative 'lib/delivery_calculator'
require_relative 'lib/offer_calculator'

# Shows all required test cases and extensibility features
class BasketExamples
  def self.run_examples
    puts "Acme Widget Co - Basket Examples"
    puts "=" * 40

    # Set up the system components
    catalogue = ProductCatalogue.new
    delivery_calculator = DeliveryCalculator.new
    offer_calculator = OfferCalculator.new

    # Example 1: B01, G01 = $37.85
    puts "\nExample 1: Blue Widget + Green Widget"
    basket = Basket.new(catalogue, delivery_calculator, offer_calculator)
    basket.add('B01')
    basket.add('G01')
    print_basket_details(basket)

    # Example 2: R01, R01 = $54.375 (with red widget offer)
    puts "\nExample 2: Two Red Widgets (with offer)"
    basket = Basket.new(catalogue, delivery_calculator, offer_calculator)
    basket.add('R01')
    basket.add('R01')
    print_basket_details(basket)

    # Example 3: R01, G01 = $60.85
    puts "\nExample 3: Red Widget + Green Widget"
    basket = Basket.new(catalogue, delivery_calculator, offer_calculator)
    basket.add('R01')
    basket.add('G01')
    print_basket_details(basket)

    # Example 4: B01, B01, R01, R01, R01 = $98.275
    puts "\nExample 4: Mixed basket with multiple items"
    basket = Basket.new(catalogue, delivery_calculator, offer_calculator)
    basket.add('B01')
    basket.add('B01')
    basket.add('R01')
    basket.add('R01')
    basket.add('R01')
    print_basket_details(basket)

    puts "\n" + "=" * 40
    puts "Examples completed!"
  end

  private

  def self.print_basket_details(basket)
    summary = basket.summary

    puts "Items: #{summary[:items].join(', ')}"
    puts "Subtotal: $#{summary[:subtotal].round(2)}"
    puts "Discount: -$#{summary[:discount].round(2)}" if summary[:discount] > 0
    puts "Delivery: $#{summary[:delivery].round(2)}"
    puts "Total: $#{summary[:total].round(2)}"
    puts "-" * 30
  end
end

BasketExamples.run_examples
