# Acme Widget Co - Shopping Basket System

A Ruby implementation of a shopping basket system for Acme Widget Co with support for products, delivery charges, and special offers.

### Core Classes

- Product - It contains a single product with name, code and price
- ProductCatalogue - It manages the collection of available products
- Basket - Used for adding products and calculating totals
- DeliveryCalculator - Calculates delivery charges
- OfferCalculator - Applies special offers

### Sample Examples

```bash
ruby basket_examples.rb
```

### Running Tests

```bash
ruby basket_test.rb
```

## Project Structure

```
├── README.md                               # This file
├── lib/
│   ├── product.rb                          # Product value object with name, code, price
│   ├── product_catalogue.rb                # Product management with array-based storage
│   ├── delivery_calculator.rb              # Delivery logic
│   ├── offer_calculator.rb                 # Offers calculator
│   ├── basket.rb                           # Main basket orchestrator
│   └── offers/
│       └── red_widget_half_price_offer.rb  # Red widget discount strategy
├── basket_test.rb                          # Comprehensive test suite
└── basket_examples.rb                      # Usage demonstrations
```

## Development Process

This project was developed with meaningful git commits demonstrating:

1. **Initial Setup** - Project structure and requirements
2. **Core Models** - Product and ProductCatalogue
3. **Business Logic** - DeliveryCalculator and OfferCalculator
4. **Main Orchestrator** - Basket class
5. **Testing** - Comprehensive test suite
6. **Examples** - Usage demonstrations

## Assumptions

1. Product codes are case-sensitive
2. Special offers are applied before delivery calculation
3. Multiple offers can be applied simultaneously
4. Invalid product codes are ignored (could be enhanced to raise errors)
5. Delivery is calculated on the discounted subtotal

## Extensibility

The system is designed to be easily extensible:

- **New Products**: Add to the ProductCatalogue
- **New Delivery Rules**: Modify DeliveryCalculator or create new strategy
- **New Offers**: Add new offer strategies to OfferCalculator
- **New Calculators**: Inject different calculator implementations
