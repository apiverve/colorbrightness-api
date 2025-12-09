using System;
using System.Collections.Generic;
using System.Text;
using Newtonsoft.Json;

namespace APIVerve.API.ColorBrightnessCalculator
{
    /// <summary>
    /// Query options for the Color Brightness Calculator API
    /// </summary>
    public class ColorBrightnessCalculatorQueryOptions
    {
        /// <summary>
        /// Hex color value (with or without # prefix)
        /// Example: FF5733
        /// </summary>
        [JsonProperty("hex")]
        public string Hex { get; set; }
    }
}
