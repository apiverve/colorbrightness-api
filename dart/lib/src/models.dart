/// Response models for the Color Brightness Calculator API.

/// API Response wrapper.
class ColorbrightnessResponse {
  final String status;
  final dynamic error;
  final ColorbrightnessData? data;

  /// Set only when the current plan locks one or more fields; null otherwise.
  final PremiumInfo? premium;

  ColorbrightnessResponse({
    required this.status,
    this.error,
    this.data,
    this.premium,
  });

  factory ColorbrightnessResponse.fromJson(Map<String, dynamic> json) => ColorbrightnessResponse(
    status: json['status'] as String? ?? '',
    error: json['error'],
    data: json['data'] != null ? ColorbrightnessData.fromJson(json['data']) : null,
    premium: json['premium'] != null ? PremiumInfo.fromJson(json['premium']) : null,
  );

  Map<String, dynamic> toJson() => {
    'status': status,
    if (error != null) 'error': error,
    if (data != null) 'data': data,
    if (premium != null) 'premium': premium!.toJson(),
  };
}

/// Describes fields the current plan does not unlock. Locked fields arrive as null
/// in [data], and [lockedFields] names them (nested ones use dot paths).
class PremiumInfo {
  final String? message;
  final String? upgradeUrl;
  final List<String>? lockedFields;

  PremiumInfo({this.message, this.upgradeUrl, this.lockedFields});

  factory PremiumInfo.fromJson(Map<String, dynamic> json) => PremiumInfo(
    message: json['message'] as String?,
    upgradeUrl: json['upgrade_url'] as String?,
    lockedFields: (json['locked_fields'] as List?)?.map((e) => e.toString()).toList(),
  );

  Map<String, dynamic> toJson() => {
    if (message != null) 'message': message,
    if (upgradeUrl != null) 'upgrade_url': upgradeUrl,
    if (lockedFields != null) 'locked_fields': lockedFields,
  };
}

/// Response data for the Color Brightness Calculator API.

class ColorbrightnessData {
  String? hex;
  ColorbrightnessDataRgb? rgb;
  num? luminance;
  num? perceivedBrightness;
  num? yiq;
  bool? isLight;
  bool? isDark;
  String? brightnessCategory;
  String? recommendedTextColor;
  num? contrastRatioWithWhite;
  num? contrastRatioWithBlack;
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
  num? r;
  num? g;
  num? b;

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
