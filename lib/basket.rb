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

  def summary
    {
      items: @items.map(&:code)
    }
  end
end
