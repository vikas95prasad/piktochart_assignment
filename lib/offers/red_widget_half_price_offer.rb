require_relative '../product_catalogue'

module RedWidgetHalfPriceOffer
  RED_WIDGET_CODE = 'R01'

  def self.calculate_discount(items)
    red_widgets = items.select { |item| item.code == RED_WIDGET_CODE }
    pairs = red_widgets.length / 2

    return 0.0 if pairs == 0 || red_widgets.empty?

    # Each pair gets 50% discount on the second widget
    discount_per_pair = red_widgets.first.price * 0.5
    (discount_per_pair * pairs).round(2)
  end
end
