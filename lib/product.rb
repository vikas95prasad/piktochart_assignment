class Product
  attr_reader :code, :price

  def initialize(code, price)
    @code = code
    @price = price
  end
end
