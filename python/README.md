Color Brightness Calculator API
============

Color Brightness Calculator is a tool for calculating color brightness and luminance. It determines if a color is light or dark using WCAG 2.0 standards and provides contrast ratios for accessibility compliance.

![Build Status](https://img.shields.io/badge/build-passing-green)
![Code Climate](https://img.shields.io/badge/maintainability-B-purple)
![Prod Ready](https://img.shields.io/badge/production-ready-blue)

This is a Python API Wrapper for the [Color Brightness Calculator API](https://apiverve.com/marketplace/colorbrightness?utm_source=pypi&utm_medium=readme)

---

## Installation

Using `pip`:

```bash
pip install apiverve-colorbrightnesscalculator
```

Using `pip3`:

```bash
pip3 install apiverve-colorbrightnesscalculator
```

---

## Configuration

Before using the colorbrightness API client, you have to setup your account and obtain your API Key.
You can get it by signing up at [https://apiverve.com](https://apiverve.com?utm_source=pypi&utm_medium=readme)

---

## Quick Start

Here's a simple example to get you started quickly:

```python
from apiverve_colorbrightnesscalculator.apiClient import ColorbrightnessAPIClient

# Initialize the client with your APIVerve API key
api = ColorbrightnessAPIClient("[YOUR_API_KEY]")

query = { "hex": "FF5733" }

try:
    # Make the API call
    result = api.execute(query)

    # Print the result
    print(result)
except Exception as e:
    print(f"Error: {e}")
```

---

## Usage

The Color Brightness Calculator API documentation is found here: [https://docs.apiverve.com/ref/colorbrightness](https://docs.apiverve.com/ref/colorbrightness?utm_source=pypi&utm_medium=readme).
You can find parameters, example responses, and status codes documented here.

### Setup

```python
# Import the client module
from apiverve_colorbrightnesscalculator.apiClient import ColorbrightnessAPIClient

# Initialize the client with your APIVerve API key
api = ColorbrightnessAPIClient("[YOUR_API_KEY]")
```

---

## Perform Request

Using the API client, you can perform requests to the API.

###### Define Query

```python
query = { "hex": "FF5733" }
```

###### Simple Request

```python
# Make a request to the API
result = api.execute(query)

# Print the result
print(result)
```

###### Example Response

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

---

## Error Handling

The API client provides comprehensive error handling through the `ColorbrightnessAPIClientError` exception. Here are some examples:

### Basic Error Handling

```python
from apiverve_colorbrightnesscalculator.apiClient import ColorbrightnessAPIClient, ColorbrightnessAPIClientError

api = ColorbrightnessAPIClient("[YOUR_API_KEY]")

query = { "hex": "FF5733" }

try:
    result = api.execute(query)
    print("Success!")
    print(result)
except ColorbrightnessAPIClientError as e:
    print(f"API Error: {e.message}")
    if e.status_code:
        print(f"Status Code: {e.status_code}")
    if e.response:
        print(f"Response: {e.response}")
```

### Handling Specific Error Types

```python
from apiverve_colorbrightnesscalculator.apiClient import ColorbrightnessAPIClient, ColorbrightnessAPIClientError

api = ColorbrightnessAPIClient("[YOUR_API_KEY]")

query = { "hex": "FF5733" }

try:
    result = api.execute(query)

    # Check for successful response
    if result.get('status') == 'success':
        print("Request successful!")
        print(result.get('data'))
    else:
        print(f"API returned an error: {result.get('error')}")

except ColorbrightnessAPIClientError as e:
    # Handle API client errors
    if e.status_code == 401:
        print("Unauthorized: Invalid API key")
    elif e.status_code == 429:
        print("Rate limit exceeded")
    elif e.status_code >= 500:
        print("Server error - please try again later")
    else:
        print(f"API error: {e.message}")
except Exception as e:
    # Handle unexpected errors
    print(f"Unexpected error: {str(e)}")
```

### Using Context Manager (Recommended)

The client supports the context manager protocol for automatic resource cleanup:

```python
from apiverve_colorbrightnesscalculator.apiClient import ColorbrightnessAPIClient, ColorbrightnessAPIClientError

query = { "hex": "FF5733" }

# Using context manager ensures proper cleanup
with ColorbrightnessAPIClient("[YOUR_API_KEY]") as api:
    try:
        result = api.execute(query)
        print(result)
    except ColorbrightnessAPIClientError as e:
        print(f"Error: {e.message}")
# Session is automatically closed here
```

---

## Advanced Features

### Debug Mode

Enable debug logging to see detailed request and response information:

```python
from apiverve_colorbrightnesscalculator.apiClient import ColorbrightnessAPIClient

# Enable debug mode
api = ColorbrightnessAPIClient("[YOUR_API_KEY]", debug=True)

query = { "hex": "FF5733" }

# Debug information will be printed to console
result = api.execute(query)
```

### Manual Session Management

If you need to manually manage the session lifecycle:

```python
from apiverve_colorbrightnesscalculator.apiClient import ColorbrightnessAPIClient

api = ColorbrightnessAPIClient("[YOUR_API_KEY]")

query = { "hex": "FF5733" }

try:
    result = api.execute(query)
    print(result)
finally:
    # Manually close the session when done
    api.close()
```

---

## Customer Support

Need any assistance? [Get in touch with Customer Support](https://apiverve.com/contact?utm_source=pypi&utm_medium=readme).

---

## Updates
Stay up to date by following [@apiverveHQ](https://twitter.com/apiverveHQ) on Twitter.

---

## Legal

All usage of the APIVerve website, API, and services is subject to the [APIVerve Terms of Service](https://apiverve.com/terms?utm_source=pypi&utm_medium=readme) and all legal documents and agreements.

---

## License
Licensed under the The MIT License (MIT)

Copyright (&copy;) 2026 APIVerve, and EvlarSoft LLC

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
