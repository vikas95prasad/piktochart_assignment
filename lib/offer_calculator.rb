require_relative 'offers/red_widget_half_price_offer'

# Manages collection of offer modules and calculates total discounts
class OfferCalculator
  def initialize
    @offers = []
    setup_default_offers
  end

  def apply_offers(items)
    total_discount = 0.0

    @offers.each do |offer|
      total_discount += offer.calculate_discount(items)
    end

    total_discount.round(2)
  end

  def add_offer(offer)
    @offers << offer
  end

  private

  def setup_default_offers
    add_offer(RedWidgetHalfPriceOffer)
  end
end
