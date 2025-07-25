class DeliveryCalculator
  def initialize
     @delivery_rules = [
      { threshold: 90, charge: 0 },     # Free delivery
      { threshold: 50, charge: 2.95 },  # Mid-tier
      { threshold: 0, charge: 4.95 }    # Standard
    ]
  end

  def calculate_delivery(subtotal)
    rule = @delivery_rules.find { |r| subtotal >= r[:threshold] }
    rule[:charge]
  end

  def add_delivery_rule
  end
end
