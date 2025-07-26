# Represents a single product with code and price
class Product
  attr_reader :code, :price

  def initialize(code, price)
    raise ArgumentError, "Code cannot be nil or empty" if code.nil? || code.to_s.strip.empty?
    raise ArgumentError, "Price must be non-negative" if price.to_f < 0

    @code = code
    @price = price.to_f.round(2)
  end
end
