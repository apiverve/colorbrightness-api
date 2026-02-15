# Color Brightness Calculator API - Go Client

Color Brightness Calculator is a tool for calculating color brightness and luminance. It determines if a color is light or dark using WCAG 2.0 standards and provides contrast ratios for accessibility compliance.

![Build Status](https://img.shields.io/badge/build-passing-green)
![Code Climate](https://img.shields.io/badge/maintainability-B-purple)
![Prod Ready](https://img.shields.io/badge/production-ready-blue)

This is a Go client for the [Color Brightness Calculator API](https://apiverve.com/marketplace/colorbrightness?utm_source=go&utm_medium=readme)

---

## Installation

```bash
go get github.com/apiverve/colorbrightness-api/go
```

---

## Configuration

Before using the Color Brightness Calculator API client, you need to obtain your API key.
You can get it by signing up at [https://apiverve.com](https://apiverve.com?utm_source=go&utm_medium=readme)

---

## Quick Start

[Get started with the Quick Start Guide](https://docs.apiverve.com/quickstart?utm_source=go&utm_medium=readme)

The Color Brightness Calculator API documentation is found here: [https://docs.apiverve.com/ref/colorbrightness](https://docs.apiverve.com/ref/colorbrightness?utm_source=go&utm_medium=readme)

---

## Usage

```go
package main

import (
    "fmt"
    "log"

    "github.com/apiverve/colorbrightness-api/go"
)

func main() {
    // Create a new client
    client := colorbrightness.NewClient("YOUR_API_KEY")

    // Set up parameters
    params := map[string]interface{}{
        "hex": "FF5733"
    }

    // Make the request
    response, err := client.Execute(params)
    if err != nil {
        log.Fatal(err)
    }

    fmt.Printf("Status: %s\n", response.Status)
    fmt.Printf("Data: %+v\n", response.Data)
}
```

---

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

---

## Customer Support

Need any assistance? [Get in touch with Customer Support](https://apiverve.com/contact?utm_source=go&utm_medium=readme).

---

## Updates

Stay up to date by following [@apiverveHQ](https://twitter.com/apiverveHQ) on Twitter.

---

## Legal

All usage of the APIVerve website, API, and services is subject to the [APIVerve Terms of Service](https://apiverve.com/terms?utm_source=go&utm_medium=readme), [Privacy Policy](https://apiverve.com/privacy?utm_source=go&utm_medium=readme), and [Refund Policy](https://apiverve.com/refund?utm_source=go&utm_medium=readme).

---

## License
Licensed under the The MIT License (MIT)

Copyright (&copy;) 2026 APIVerve, and EvlarSoft LLC

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
