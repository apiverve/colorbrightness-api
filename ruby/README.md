# Color Brightness Calculator API - Ruby Gem

Color Brightness Calculator checks hex color brightness to classify values as light, dark, or medium, returning RGB components. Paid plans add WCAG contrast ratios, luminance scores, and recommended text colors.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'apiverve_colorbrightness'
```

And then execute:

```bash
$ bundle install
```

Or install it yourself as:

```bash
$ gem install apiverve_colorbrightness
```

## Getting Started

Get your API key at [APIVerve](https://apiverve.com)

### Basic Usage

```ruby
require 'apiverve_colorbrightness'

# Initialize the client
client = APIVerve::Colorbrightness::Client.new(api_key: "YOUR_API_KEY")

# Make a request
response = client.execute({ hex: "FF5733" })

# Print the response
puts response
```


### Error Handling

```ruby
begin
  response = client.execute({ hex: "FF5733" })
  puts response["data"]
rescue APIVerve::Colorbrightness::ValidationError => e
  puts "Validation error: #{e.errors.join(', ')}"
rescue APIVerve::Colorbrightness::APIError => e
  puts "API error: #{e.message}"
  puts "Status code: #{e.status_code}"
end
```

### Debug Mode

```ruby
# Enable debug logging
client = APIVerve::Colorbrightness::Client.new(
  api_key: "YOUR_API_KEY",
  debug: true
)
```

## Example Response

```json
{
  "status": "ok",
  "error": null,
  "data": {
    "hex": "#FF5733",
    "rgb": {
      "r": 255,
      "g": 87,
      "b": 51
    },
    "luminance": 0.2832,
    "perceived_brightness": 131,
    "yiq": 133.13,
    "is_light": false,
    "is_dark": true,
    "brightness_category": "dark",
    "recommended_text_color": "#FFFFFF",
    "contrast_ratio_with_white": 3.15,
    "contrast_ratio_with_black": 6.66,
    "wcag_aa_compliant_with_white": false,
    "wcag_aa_compliant_with_black": true,
    "wcag_aaa_compliant_with_white": false,
    "wcag_aaa_compliant_with_black": false
  }
}
```

## Documentation

For more information, visit the [API Documentation](https://docs.apiverve.com/ref/colorbrightness?utm_source=rubygems&utm_medium=referral&utm_content=readme).

## Support

- Website: [https://apiverve.com/marketplace/colorbrightness?utm_source=ruby&utm_medium=referral&utm_content=readme](https://apiverve.com/marketplace/colorbrightness?utm_source=ruby&utm_medium=referral&utm_content=readme)
- Email: hello@apiverve.com

## License

This gem is available under the [MIT License](LICENSE).
