# Represents a single product with name, code, and price
class Product
  attr_reader :code, :name, :price

  def initialize(name, code, price)
    raise ArgumentError, "Name cannot be nil or empty" if name.nil? || name.to_s.strip.empty?
    raise ArgumentError, "Code cannot be nil or empty" if code.nil? || code.to_s.strip.empty?
    raise ArgumentError, "Price must be non-negative" if price.to_f < 0

    @name = name
    @code = code
    @price = price.to_f.round(2)
  end
end
