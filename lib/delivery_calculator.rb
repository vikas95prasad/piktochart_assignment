# Calculates delivery charges based on order total
# Implements business rules for delivery pricing tiers
class DeliveryCalculator
  def initialize
    # Delivery rules ordered by threshold (descending)
    @delivery_rules = [
      { threshold: 90.0, charge: 0.0 },    # Free delivery
      { threshold: 50.0, charge: 2.95 },   # Mid-tier
      { threshold: 0.0, charge: 4.95 }     # Standard
    ]
  end

  def calculate_delivery(subtotal)
    return 4.95 if subtotal.nil? || subtotal < 0

    rule = @delivery_rules.find { |r| subtotal >= r[:threshold] }
    rule[:charge]
  end

  # Allow custom delivery rules for extensibility
  def add_delivery_rule(threshold, charge)
    @delivery_rules << {
      threshold: threshold.to_f.round(2),
      charge: charge.to_f.round(2)
    }
    @delivery_rules.sort_by! { |rule| -rule[:threshold] }  # Sort descending
  end
end
