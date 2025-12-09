// Converter.java

// To use this code, add the following Maven dependency to your project:
//
//
//     com.fasterxml.jackson.core     : jackson-databind          : 2.9.0
//     com.fasterxml.jackson.datatype : jackson-datatype-jsr310   : 2.9.0
//
// Import this package:
//
//     import com.apiverve.data.Converter;
//
// Then you can deserialize a JSON string with
//
//     ColorBrightnessCalculatorData data = Converter.fromJsonString(jsonString);

package com.apiverve.colorbrightness.data;

import java.io.IOException;
import com.fasterxml.jackson.databind.*;
import com.fasterxml.jackson.databind.module.SimpleModule;
import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.core.JsonProcessingException;
import java.util.*;
import java.time.LocalDate;
import java.time.OffsetDateTime;
import java.time.OffsetTime;
import java.time.ZoneOffset;
import java.time.ZonedDateTime;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeFormatterBuilder;
import java.time.temporal.ChronoField;

public class Converter {
    // Date-time helpers

    private static final DateTimeFormatter DATE_TIME_FORMATTER = new DateTimeFormatterBuilder()
            .appendOptional(DateTimeFormatter.ISO_DATE_TIME)
            .appendOptional(DateTimeFormatter.ISO_OFFSET_DATE_TIME)
            .appendOptional(DateTimeFormatter.ISO_INSTANT)
            .appendOptional(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss.SX"))
            .appendOptional(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ssX"))
            .appendOptional(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"))
            .toFormatter()
            .withZone(ZoneOffset.UTC);

    public static OffsetDateTime parseDateTimeString(String str) {
        return ZonedDateTime.from(Converter.DATE_TIME_FORMATTER.parse(str)).toOffsetDateTime();
    }

    private static final DateTimeFormatter TIME_FORMATTER = new DateTimeFormatterBuilder()
            .appendOptional(DateTimeFormatter.ISO_TIME)
            .appendOptional(DateTimeFormatter.ISO_OFFSET_TIME)
            .parseDefaulting(ChronoField.YEAR, 2020)
            .parseDefaulting(ChronoField.MONTH_OF_YEAR, 1)
            .parseDefaulting(ChronoField.DAY_OF_MONTH, 1)
            .toFormatter()
            .withZone(ZoneOffset.UTC);

    public static OffsetTime parseTimeString(String str) {
        return ZonedDateTime.from(Converter.TIME_FORMATTER.parse(str)).toOffsetDateTime().toOffsetTime();
    }
    // Serialize/deserialize helpers

    public static ColorBrightnessCalculatorData fromJsonString(String json) throws IOException {
        return getObjectReader().readValue(json);
    }

    public static String toJsonString(ColorBrightnessCalculatorData obj) throws JsonProcessingException {
        return getObjectWriter().writeValueAsString(obj);
    }

    private static ObjectReader reader;
    private static ObjectWriter writer;

    private static void instantiateMapper() {
        ObjectMapper mapper = new ObjectMapper();
        mapper.findAndRegisterModules();
        mapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
        mapper.configure(SerializationFeature.WRITE_DATES_AS_TIMESTAMPS, false);
        SimpleModule module = new SimpleModule();
        module.addDeserializer(OffsetDateTime.class, new JsonDeserializer<OffsetDateTime>() {
            @Override
            public OffsetDateTime deserialize(JsonParser jsonParser, DeserializationContext deserializationContext) throws IOException, JsonProcessingException {
                String value = jsonParser.getText();
                return Converter.parseDateTimeString(value);
            }
        });
        mapper.registerModule(module);
        reader = mapper.readerFor(ColorBrightnessCalculatorData.class);
        writer = mapper.writerFor(ColorBrightnessCalculatorData.class);
    }

    private static ObjectReader getObjectReader() {
        if (reader == null) instantiateMapper();
        return reader;
    }

    private static ObjectWriter getObjectWriter() {
        if (writer == null) instantiateMapper();
        return writer;
    }
}

// ColorBrightnessCalculatorData.java

package com.apiverve.colorbrightness.data;

import com.fasterxml.jackson.annotation.*;

public class ColorBrightnessCalculatorData {
    private String hex;
    private RGB rgb;
    private double luminance;
    private long perceivedBrightness;
    private double yiq;
    private boolean isLight;
    private boolean isDark;
    private String brightnessCategory;
    private String recommendedTextColor;
    private double contrastRatioWithWhite;
    private double contrastRatioWithBlack;
    private boolean wcagAaCompliantWithWhite;
    private boolean wcagAaCompliantWithBlack;
    private boolean wcagAAACompliantWithWhite;
    private boolean wcagAAACompliantWithBlack;

    @JsonProperty("hex")
    public String getHex() { return hex; }
    @JsonProperty("hex")
    public void setHex(String value) { this.hex = value; }

    @JsonProperty("rgb")
    public RGB getRGB() { return rgb; }
    @JsonProperty("rgb")
    public void setRGB(RGB value) { this.rgb = value; }

    @JsonProperty("luminance")
    public double getLuminance() { return luminance; }
    @JsonProperty("luminance")
    public void setLuminance(double value) { this.luminance = value; }

    @JsonProperty("perceived_brightness")
    public long getPerceivedBrightness() { return perceivedBrightness; }
    @JsonProperty("perceived_brightness")
    public void setPerceivedBrightness(long value) { this.perceivedBrightness = value; }

    @JsonProperty("yiq")
    public double getYiq() { return yiq; }
    @JsonProperty("yiq")
    public void setYiq(double value) { this.yiq = value; }

    @JsonProperty("is_light")
    public boolean getIsLight() { return isLight; }
    @JsonProperty("is_light")
    public void setIsLight(boolean value) { this.isLight = value; }

    @JsonProperty("is_dark")
    public boolean getIsDark() { return isDark; }
    @JsonProperty("is_dark")
    public void setIsDark(boolean value) { this.isDark = value; }

    @JsonProperty("brightness_category")
    public String getBrightnessCategory() { return brightnessCategory; }
    @JsonProperty("brightness_category")
    public void setBrightnessCategory(String value) { this.brightnessCategory = value; }

    @JsonProperty("recommended_text_color")
    public String getRecommendedTextColor() { return recommendedTextColor; }
    @JsonProperty("recommended_text_color")
    public void setRecommendedTextColor(String value) { this.recommendedTextColor = value; }

    @JsonProperty("contrast_ratio_with_white")
    public double getContrastRatioWithWhite() { return contrastRatioWithWhite; }
    @JsonProperty("contrast_ratio_with_white")
    public void setContrastRatioWithWhite(double value) { this.contrastRatioWithWhite = value; }

    @JsonProperty("contrast_ratio_with_black")
    public double getContrastRatioWithBlack() { return contrastRatioWithBlack; }
    @JsonProperty("contrast_ratio_with_black")
    public void setContrastRatioWithBlack(double value) { this.contrastRatioWithBlack = value; }

    @JsonProperty("wcag_aa_compliant_with_white")
    public boolean getWCAGAaCompliantWithWhite() { return wcagAaCompliantWithWhite; }
    @JsonProperty("wcag_aa_compliant_with_white")
    public void setWCAGAaCompliantWithWhite(boolean value) { this.wcagAaCompliantWithWhite = value; }

    @JsonProperty("wcag_aa_compliant_with_black")
    public boolean getWCAGAaCompliantWithBlack() { return wcagAaCompliantWithBlack; }
    @JsonProperty("wcag_aa_compliant_with_black")
    public void setWCAGAaCompliantWithBlack(boolean value) { this.wcagAaCompliantWithBlack = value; }

    @JsonProperty("wcag_aaa_compliant_with_white")
    public boolean getWCAGAAACompliantWithWhite() { return wcagAAACompliantWithWhite; }
    @JsonProperty("wcag_aaa_compliant_with_white")
    public void setWCAGAAACompliantWithWhite(boolean value) { this.wcagAAACompliantWithWhite = value; }

    @JsonProperty("wcag_aaa_compliant_with_black")
    public boolean getWCAGAAACompliantWithBlack() { return wcagAAACompliantWithBlack; }
    @JsonProperty("wcag_aaa_compliant_with_black")
    public void setWCAGAAACompliantWithBlack(boolean value) { this.wcagAAACompliantWithBlack = value; }
}

// RGB.java

package com.apiverve.colorbrightness.data;

import com.fasterxml.jackson.annotation.*;

public class RGB {
    private long r;
    private long g;
    private long b;

    @JsonProperty("r")
    public long getR() { return r; }
    @JsonProperty("r")
    public void setR(long value) { this.r = value; }

    @JsonProperty("g")
    public long getG() { return g; }
    @JsonProperty("g")
    public void setG(long value) { this.g = value; }

    @JsonProperty("b")
    public long getB() { return b; }
    @JsonProperty("b")
    public void setB(long value) { this.b = value; }
}