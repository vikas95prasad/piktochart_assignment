require_relative 'lib/basket'
require_relative 'lib/product_catalogue'
require_relative 'lib/delivery_calculator'
require_relative 'lib/offer_calculator'

class BasketExamples
  def self.run_examples
    puts "Acme Widget Co - Basket Examples"
    puts "=" * 40

    # Set up the system components
    catalogue = ProductCatalogue.new
    delivery_calculator = DeliveryCalculator.new
    offer_calculator = OfferCalculator.new

    puts "\nExample 1: Blue Widget + Green Widget"
    basket = Basket.new(catalogue, delivery_calculator, offer_calculator)
    basket.add('B01')
    basket.add('G01')
    print_basket_details(basket)

    puts "\nExample 2: Two Red Widgets (with offer)"
    basket = Basket.new(catalogue, delivery_calculator, offer_calculator)
    basket.add('R01')
    basket.add('R01')
    print_basket_details(basket)

    puts "\nExample 3: Red Widget + Green Widget"
    basket = Basket.new(catalogue, delivery_calculator, offer_calculator)
    basket.add('R01')
    basket.add('G01')
    print_basket_details(basket)

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
