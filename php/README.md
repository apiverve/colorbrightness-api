# Color Brightness Calculator API - PHP Package

Color Brightness Calculator is a tool for calculating color brightness and luminance. It determines if a color is light or dark using WCAG 2.0 standards and provides contrast ratios for accessibility compliance.

## Installation

Install via Composer:

```bash
composer require apiverve/colorbrightness
```

## Getting Started

Get your API key at [APIVerve](https://apiverve.com)

### Basic Usage

```php
<?php

require_once 'vendor/autoload.php';

use APIVerve\Colorbrightness\Client;

// Initialize the client
$client = new Client('YOUR_API_KEY');

// Make a request
$response = $client->execute(['hex' => 'FF5733']);

// Print the response
print_r($response);
```


### Error Handling

```php
use APIVerve\Colorbrightness\Client;
use APIVerve\Colorbrightness\Exceptions\APIException;
use APIVerve\Colorbrightness\Exceptions\ValidationException;

try {
    $response = $client->execute(['hex' => 'FF5733']);
    print_r($response['data']);
} catch (ValidationException $e) {
    echo "Validation error: " . implode(', ', $e->getErrors());
} catch (APIException $e) {
    echo "API error: " . $e->getMessage();
    echo "Status code: " . $e->getStatusCode();
}
```

### Debug Mode

```php
// Enable debug logging
$client = new Client(
    apiKey: 'YOUR_API_KEY',
    debug: true
);
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

## Requirements

- PHP 7.4 or higher
- Guzzle HTTP client

## Documentation

For more information, visit the [API Documentation](https://docs.apiverve.com/ref/colorbrightness?utm_source=packagist&utm_medium=readme).

## Support

- Website: [https://apiverve.com/marketplace/colorbrightness?utm_source=php&utm_medium=readme](https://apiverve.com/marketplace/colorbrightness?utm_source=php&utm_medium=readme)
- Email: hello@apiverve.com

## License

This package is available under the [MIT License](LICENSE).
