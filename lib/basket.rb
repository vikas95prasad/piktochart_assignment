# Main basket class that orchestrates the shopping experience
class Basket
  attr_reader :items

  def initialize(product_catalogue, delivery_calculator, offer_calculator)
    @product_catalogue = product_catalogue
    @delivery_calculator = delivery_calculator
    @offer_calculator = offer_calculator
    @items = []
  end

  def add(product_code)
    product = @product_catalogue.find_by_code(product_code)
    return false unless product

    @items << product
    true
  end

  def total
    subtotal = calculate_subtotal
    discount = apply_basket_offers
    discounted_subtotal = subtotal - discount
    delivery = @delivery_calculator.calculate_delivery(discounted_subtotal)

    (discounted_subtotal + delivery).round(2)
  end

  def subtotal
    calculate_subtotal
  end

  def discount
    @offer_calculator.apply_offers(@items)
  rescue => e
    0.0
  end

  def delivery_cost
    discounted_subtotal = calculate_subtotal - discount
    @delivery_calculator.calculate_delivery(discounted_subtotal)
  end

  def clear
    @items.clear
  end

  def item_count
    @items.length
  end

  def summary
    {
      items: @items.map(&:code),
      subtotal: subtotal,
      discount: discount,
      delivery: delivery_cost,
      total: total
    }
  end

  private

  def calculate_subtotal
    @items.sum(&:price).round(2)
  end

  def apply_basket_offers
    discount = @offer_calculator.apply_offers(@items)
  rescue => e
    discount = 0.0
  end
end
