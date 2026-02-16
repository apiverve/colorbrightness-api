# Color Brightness Calculator API - Dart/Flutter Client

Color Brightness Calculator is a tool for calculating color brightness and luminance. It determines if a color is light or dark using WCAG 2.0 standards and provides contrast ratios for accessibility compliance.

[![pub package](https://img.shields.io/pub/v/apiverve_colorbrightness.svg)](https://pub.dev/packages/apiverve_colorbrightness)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

This is the Dart/Flutter client for the [Color Brightness Calculator API](https://apiverve.com/marketplace/colorbrightness?utm_source=dart&utm_medium=readme).

## Installation

Add this to your `pubspec.yaml`:

```yaml
dependencies:
  apiverve_colorbrightness: ^1.1.14
```

Then run:

```bash
dart pub get
# or for Flutter
flutter pub get
```

## Usage

```dart
import 'package:apiverve_colorbrightness/apiverve_colorbrightness.dart';

void main() async {
  final client = ColorbrightnessClient('YOUR_API_KEY');

  try {
    final response = await client.execute({
      'hex': 'FF5733'
    });

    print('Status: ${response.status}');
    print('Data: ${response.data}');
  } catch (e) {
    print('Error: $e');
  }
}
```

## Response

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

## API Reference

- **API Home:** [Color Brightness Calculator API](https://apiverve.com/marketplace/colorbrightness?utm_source=dart&utm_medium=readme)
- **Documentation:** [docs.apiverve.com/ref/colorbrightness](https://docs.apiverve.com/ref/colorbrightness?utm_source=dart&utm_medium=readme)

## Authentication

All requests require an API key. Get yours at [apiverve.com](https://apiverve.com?utm_source=dart&utm_medium=readme).

## License

MIT License - see [LICENSE](LICENSE) for details.

---

Built with Dart for [APIVerve](https://apiverve.com?utm_source=dart&utm_medium=readme)
