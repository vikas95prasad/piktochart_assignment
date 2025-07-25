class DeliveryCalculator
  def initialize
    @delivery_rules = [
      { threshold: 90.0, charge: 0.0 },
      { threshold: 50.0, charge: 2.95 },
      { threshold: 0.0, charge: 4.95 }
    ]
  end

  def calculate_delivery(subtotal)
    rule = @delivery_rules.find { |r| subtotal >= r[:threshold] }
    rule[:charge]
  end

  def add_delivery_rule(threshold, charge)
    @delivery_rules << {
      threshold: threshold.to_f.round(2),
      charge: charge.to_f.round(2)
    }
    @delivery_rules.sort_by! { |rule| -rule[:threshold] }
  end
end
