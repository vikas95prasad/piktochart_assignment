require_relative 'product'

# Manages the collection of available products
# Provides lookup functionality and default product setup
class ProductCatalogue
  # Default products for Acme Widget Co
  DEFAULT_PRODUCTS = [
    { name: 'Red Widget', code: 'R01', price: '32.95' },
    { name: 'Green Widget', code: 'G01', price: '24.95' },
    { name: 'Blue Widget', code: 'B01', price: '7.95' }
  ].freeze

  def initialize
    @products = {}
    setup_default_products
  end

  def find_by_code(code)
    @products[code]
  end

  def add_product(name, code, price)
    @products[code] = Product.new(name, code, price)
  end

  def product_name(code)
    product = @products[code]
    product ? product.name : 'Unknown Product'
  end

  private

  def setup_default_products
    DEFAULT_PRODUCTS.each do |product_data|
      add_product(product_data[:name], product_data[:code], product_data[:price])
    end
  end
end
