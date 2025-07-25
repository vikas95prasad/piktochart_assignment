module RedWidgetHalfPriceOffer
  def self.calculate_discount(items)
    red_widgets = items.select { |item| item.code == 'R01' }
    pairs = red_widgets.length / 2

    return 0.0 if pairs == 0

    # Each pair gets 50% discount on the second widget
    discount_per_pair = red_widgets.first.price * 0.5
    (discount_per_pair * pairs).round(2)
  end
end
