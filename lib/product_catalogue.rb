require_relative 'product'

# Manages the collection of available products
# Provides lookup functionality and default product setup
class ProductCatalogue
  # Default products for Acme Widget Co
  DEFAULT_PRODUCTS = {
    'R01' => { price: '32.95', name: 'Red Widget' },
    'G01' => { price: '24.95', name: 'Green Widget' },
    'B01' => { price: '7.95', name: 'Blue Widget' }
  }.freeze

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

  def product_name(code)
    DEFAULT_PRODUCTS.dig(code, :name) || 'Unknown Product'
  end

  private

  def setup_default_products
    DEFAULT_PRODUCTS.each do |code, details|
      add_product(code, details[:price])
    end
  end
end
