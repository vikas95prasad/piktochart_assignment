require_relative 'lib/basket'
require_relative 'lib/product_catalogue'
require_relative 'lib/delivery_calculator'
require_relative 'lib/offer_calculator'

class BasketExamples
  def self.run_examples
    puts "Acme Widget Co - Basket Examples"
    puts "=" * 40

    catalogue = ProductCatalogue.new
    delivery_calculator = DeliveryCalculator.new
    offer_calculator = OfferCalculator.new

    # Example 1: B01, G01 = $37.85
    puts "\nExample 1: Blue Widget + Green Widget"
    basket = Basket.new(catalogue, delivery_calculator, offer_calculator)
    basket.add('B01')
    basket.add('G01')
    print_basket_details(basket)
  end

  private

  def self.print_basket_details(basket)
    summary = basket.summary

    puts "Items: #{summary[:items].join(', ')}"
    puts "Subtotal: $#{format('%.2f', summary[:subtotal])}"
    puts "Discount: -$#{format('%.2f', summary[:discount])}" if summary[:discount] > 0
    puts "Delivery: $#{format('%.2f', summary[:delivery])}"
    puts "Total: $#{format('%.2f', summary[:total])}"
    puts "-" * 30
  end
end

BasketExamples.run_examples
