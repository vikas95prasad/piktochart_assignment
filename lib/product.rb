class Product
  attr_reader :code, :price

  def initialize(code, price)
    @code = code
    @price = price.to_f.round(2)
  end

  def ==(other)
    other.is_a?(Product) && code == other.code && price == other.price
  end
end
