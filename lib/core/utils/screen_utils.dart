import 'dart:ui';

import 'package:covid19_app/core/consts/enums.dart';
import 'package:flutter/material.dart';

class ScreenUtils {
  SizeType deviceSize;
  BuildContext context;
  double textScaleFactor = 1.0;

  ScreenUtils() {
    _detechDeviceSize();
  }

  Map<SizeType, double> _deviceSizeRateMultipliers = {
    SizeType.xxSmall: 0.70,
    SizeType.xSmall: 0.80,
    SizeType.Small: 0.83,
    SizeType.Middle: 0.85,
    SizeType.Large: 0.87,
    SizeType.xLarge: 0.93,
    SizeType.xxLarge: 1,
    SizeType.Ultra: 1.10,
    SizeType.Mega: 1.70
  };

  Map<SizeType, double> _fontOrFontSizeRateMultipliers = {
    SizeType.xxSmall: 1,
    SizeType.xSmall: 1.03,
    SizeType.Small: 1.03,
    SizeType.Middle: 1.07,
    SizeType.Large: 1.12,
    SizeType.xLarge: 1.15,
    SizeType.xxLarge: 1.18,
    SizeType.Ultra: 1.21,
    SizeType.Mega: 1.50
  };

  Map<SizeType, double> _deviceFontSizes = {
    SizeType.xxSmall: 16,
    SizeType.xSmall: 18,
    SizeType.Small: 20,
    SizeType.Middle: 24,
    SizeType.Large: 26,
    SizeType.xLarge: 28,
    SizeType.xxLarge: 30,
    SizeType.Ultra: 35,
    SizeType.Mega: 40
  };

  Map<SizeType, double> _deviceIconSizes = {
    SizeType.xxSmall: 20,
    SizeType.xSmall: 22,
    SizeType.Small: 24,
    SizeType.Middle: 26,
    SizeType.Large: 28,
    SizeType.xLarge: 30,
    SizeType.xxLarge: 35,
    SizeType.Ultra: 40,
    SizeType.Mega: 50
  };

  // It inits in bootstart component in build method
  init(BuildContext context) {
    this.context = context;
    this.textScaleFactor = MediaQuery.of(context).textScaleFactor;
  }

  _detechDeviceSize() {
    double width = window.physicalSize.width;
    double height = window.physicalSize.height;

    print(width.toString() + " * " + height.toString());
    if (width <= 240) {
      deviceSize = SizeType.xxSmall;
    } else if (width <= 360) {
      deviceSize = SizeType.xSmall;
    } else if (width <= 480) {
      deviceSize = SizeType.Small;
    } else if (width <= 540) {
      deviceSize = SizeType.Middle;
    } else if (width <= 720) {
      deviceSize = SizeType.Large;
    } else if (width <= 900) {
      deviceSize = SizeType.xLarge;
    } else if (width <= 1080) {
      deviceSize = SizeType.xxLarge;
    } else if (width <= 1440) {
      deviceSize = SizeType.Ultra;
    } else {
      deviceSize = SizeType.Mega;
    }
    print(width.toString() + " " + deviceSize.toString());
  }

  get _sizeFontMultiplier {
    if (deviceSize == null) {
      deviceSize = SizeType.Middle;
    }
    return textScaleFactor * _fontOrFontSizeRateMultipliers[deviceSize];
  }

  get _deviceSizeMultiplier {
    if (deviceSize == null) {
      deviceSize = SizeType.Mega;
    }
    return _deviceSizeRateMultipliers[deviceSize];
  }

  double getIconSize(SizeType type) {
    return this.convertToDeviceSize(_deviceIconSizes[type]) *
        _fontOrFontSizeRateMultipliers[deviceSize];
  }

  double getFontSize(SizeType type) {
    return this.convertToDeviceSize(_deviceFontSizes[type]) *
        _sizeFontMultiplier;
  }

  double convertToDeviceSize(double size) {
    return size * _deviceSizeMultiplier;
  }
}
