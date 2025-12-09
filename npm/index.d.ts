declare module '@apiverve/colorbrightness' {
  export interface colorbrightnessOptions {
    api_key: string;
    secure?: boolean;
  }

  export interface colorbrightnessResponse {
    status: string;
    error: string | null;
    data: ColorBrightnessCalculatorData;
    code?: number;
  }


  interface ColorBrightnessCalculatorData {
      hex:                       string;
      rgb:                       RGB;
      luminance:                 number;
      perceivedBrightness:       number;
      yiq:                       number;
      isLight:                   boolean;
      isDark:                    boolean;
      brightnessCategory:        string;
      recommendedTextColor:      string;
      contrastRatioWithWhite:    number;
      contrastRatioWithBlack:    number;
      wcagAaCompliantWithWhite:  boolean;
      wcagAaCompliantWithBlack:  boolean;
      wcagAAACompliantWithWhite: boolean;
      wcagAAACompliantWithBlack: boolean;
  }
  
  interface RGB {
      r: number;
      g: number;
      b: number;
  }

  export default class colorbrightnessWrapper {
    constructor(options: colorbrightnessOptions);

    execute(callback: (error: any, data: colorbrightnessResponse | null) => void): Promise<colorbrightnessResponse>;
    execute(query: Record<string, any>, callback: (error: any, data: colorbrightnessResponse | null) => void): Promise<colorbrightnessResponse>;
    execute(query?: Record<string, any>): Promise<colorbrightnessResponse>;
  }
}
