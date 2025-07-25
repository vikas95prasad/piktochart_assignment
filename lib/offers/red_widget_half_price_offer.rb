require_relative '../product_catalogue'

module RedWidgetHalfPriceOffer
  RED_WIDGET_CODE = ProductCatalogue::DEFAULT_PRODUCTS.keys.first

  def self.calculate_discount(items)
    red_widgets = items.select { |item| item.code == RED_WIDGET_CODE }
    pairs = red_widgets.length / 2

    return 0.0 if pairs == 0

    discount_per_pair = red_widgets.first.price * 0.5
    (discount_per_pair * pairs).round(2)
  end
end
