require_relative 'product'

class ProductCatalogue
  def initialize
    @products = {}
    setup_default_products
  end

  def find_by_code(code)
    @products[code]
  end

  def add_product(code, price)
    @products[code] = Product.new(code, price)
  end

  def print_all_products
    @products.values
  end

  private

  def setup_default_products
    add_product('R01', '32.95')  # Red Widget
    add_product('G01', '24.95')  # Green Widget
    add_product('B01', '7.95')   # Blue Widget
  end
end
