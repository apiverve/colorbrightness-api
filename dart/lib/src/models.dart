/// Response models for the Color Brightness Calculator API.

/// API Response wrapper.
class ColorbrightnessResponse {
  final String status;
  final dynamic error;
  final ColorbrightnessData? data;

  ColorbrightnessResponse({
    required this.status,
    this.error,
    this.data,
  });

  factory ColorbrightnessResponse.fromJson(Map<String, dynamic> json) => ColorbrightnessResponse(
    status: json['status'] as String? ?? '',
    error: json['error'],
    data: json['data'] != null ? ColorbrightnessData.fromJson(json['data']) : null,
  );

  Map<String, dynamic> toJson() => {
    'status': status,
    if (error != null) 'error': error,
    if (data != null) 'data': data,
  };
}

/// Response data for the Color Brightness Calculator API.

class ColorbrightnessData {
  String? hex;
  ColorbrightnessDataRgb? rgb;
  double? luminance;
  int? perceivedBrightness;
  double? yiq;
  bool? isLight;
  bool? isDark;
  String? brightnessCategory;
  String? recommendedTextColor;
  double? contrastRatioWithWhite;
  double? contrastRatioWithBlack;
  bool? wcagAaCompliantWithWhite;
  bool? wcagAaCompliantWithBlack;
  bool? wcagAaaCompliantWithWhite;
  bool? wcagAaaCompliantWithBlack;

  ColorbrightnessData({
    this.hex,
    this.rgb,
    this.luminance,
    this.perceivedBrightness,
    this.yiq,
    this.isLight,
    this.isDark,
    this.brightnessCategory,
    this.recommendedTextColor,
    this.contrastRatioWithWhite,
    this.contrastRatioWithBlack,
    this.wcagAaCompliantWithWhite,
    this.wcagAaCompliantWithBlack,
    this.wcagAaaCompliantWithWhite,
    this.wcagAaaCompliantWithBlack,
  });

  factory ColorbrightnessData.fromJson(Map<String, dynamic> json) => ColorbrightnessData(
      hex: json['hex'],
      rgb: json['rgb'] != null ? ColorbrightnessDataRgb.fromJson(json['rgb']) : null,
      luminance: json['luminance'],
      perceivedBrightness: json['perceived_brightness'],
      yiq: json['yiq'],
      isLight: json['is_light'],
      isDark: json['is_dark'],
      brightnessCategory: json['brightness_category'],
      recommendedTextColor: json['recommended_text_color'],
      contrastRatioWithWhite: json['contrast_ratio_with_white'],
      contrastRatioWithBlack: json['contrast_ratio_with_black'],
      wcagAaCompliantWithWhite: json['wcag_aa_compliant_with_white'],
      wcagAaCompliantWithBlack: json['wcag_aa_compliant_with_black'],
      wcagAaaCompliantWithWhite: json['wcag_aaa_compliant_with_white'],
      wcagAaaCompliantWithBlack: json['wcag_aaa_compliant_with_black'],
    );
}

class ColorbrightnessDataRgb {
  int? r;
  int? g;
  int? b;

  ColorbrightnessDataRgb({
    this.r,
    this.g,
    this.b,
  });

  factory ColorbrightnessDataRgb.fromJson(Map<String, dynamic> json) => ColorbrightnessDataRgb(
      r: json['r'],
      g: json['g'],
      b: json['b'],
    );
}

class ColorbrightnessRequest {
  String hex;

  ColorbrightnessRequest({
    required this.hex,
  });

  Map<String, dynamic> toJson() => {
      'hex': hex,
    };
}
