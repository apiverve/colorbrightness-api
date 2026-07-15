declare module '@apiverve/colorbrightness' {
  export interface colorbrightnessOptions {
    api_key: string;
    secure?: boolean;
  }

  /**
   * Describes fields the current plan does not unlock. Locked fields arrive as null
   * in `data`; `locked_fields` names them, using dot paths for nested fields.
   * Absent when the plan unlocks everything.
   */
  export interface PremiumInfo {
    message: string;
    upgrade_url: string;
    locked_fields: string[];
  }

  export interface colorbrightnessResponse {
    status: string;
    error: string | null;
    data: ColorBrightnessCalculatorData;
    code?: number;
    premium?: PremiumInfo;
  }


  interface ColorBrightnessCalculatorData {
      hex:                       null | string;
      rgb:                       RGB;
      luminance:                 number | null;
      perceivedBrightness:       number | null;
      yiq:                       number | null;
      isLight:                   boolean | null;
      isDark:                    boolean | null;
      brightnessCategory:        null | string;
      recommendedTextColor:      null | string;
      contrastRatioWithWhite:    number | null;
      contrastRatioWithBlack:    number | null;
      wcagAaCompliantWithWhite:  boolean | null;
      wcagAaCompliantWithBlack:  boolean | null;
      wcagAAACompliantWithWhite: boolean | null;
      wcagAAACompliantWithBlack: boolean | null;
  }
  
  interface RGB {
      r: number | null;
      g: number | null;
      b: number | null;
  }

  export default class colorbrightnessWrapper {
    constructor(options: colorbrightnessOptions);

    execute(callback: (error: any, data: colorbrightnessResponse | null) => void): Promise<colorbrightnessResponse>;
    execute(query: Record<string, any>, callback: (error: any, data: colorbrightnessResponse | null) => void): Promise<colorbrightnessResponse>;
    execute(query?: Record<string, any>): Promise<colorbrightnessResponse>;
  }
}
