import 'dart:ui';

import 'package:flutter/material.dart';

import '../consts/enums.dart';
import '../widgets/index.dart';

/// [ScreenUtils] is a library for the responsiveness.
/// [ScreenUtils] converts font, icon, padding size across devices to get responsiveness.
/// I adjusted the [_deviceSizeRateMultipliers] and [_fontOrFontSizeRateMultipliers] values but they may  not performs well in every situations.
/// Example: [AppWidgetExtension]
class ScreenUtils {
  SizeType deviceSize;
  BuildContext context;
  double textScaleFactor = 1.0;

  ScreenUtils(this.context) {
    _detechDeviceSize();
    this.textScaleFactor = MediaQuery.of(context).textScaleFactor;
  }

  /// If you would change it and get positive result, please push it to our repository for improving the boilerplate!
  Map<SizeType, double> _deviceSizeRateMultipliers = {
    SizeType.xxSmall: 0.70,
    SizeType.xSmall: 0.80,
    SizeType.Small: 0.83,
    SizeType.Middle: 0.85,
    SizeType.Large: 0.90,
    SizeType.xLarge: 0.95,
    SizeType.xxLarge: 1.00,
    SizeType.Ultra: 1.15,
    SizeType.Mega: 1.50
  };

  /// If you would change it and get positive result, please push it to our repository for improving the boilerplate!
  Map<SizeType, double> _fontOrFontSizeRateMultipliers = {
    SizeType.xxSmall: 1.25,
    SizeType.xSmall: 1.30,
    SizeType.Small: 1.35,
    SizeType.Middle: 1.37,
    SizeType.Large: 1.40,
    SizeType.xLarge: 1.43,
    SizeType.xxLarge: 1.45,
    SizeType.Ultra: 1.47,
    SizeType.Mega: 1.50
  };

  Map<SizeType, double> _deviceFontSizes = {
    SizeType.Tiny: 10,
    SizeType.xxSmall: 12,
    SizeType.xSmall: 14,
    SizeType.Small: 16,
    SizeType.Middle: 18,
    SizeType.Large: 20,
    SizeType.xLarge: 22,
    SizeType.xxLarge: 24,
    SizeType.Ultra: 26,
    SizeType.Mega: 35
  };

  Map<SizeType, double> _deviceIconSizes = {
    SizeType.Tiny: 12,
    SizeType.xxSmall: 16,
    SizeType.xSmall: 18,
    SizeType.Small: 20,
    SizeType.Middle: 22,
    SizeType.Large: 24,
    SizeType.xLarge: 26,
    SizeType.xxLarge: 28,
    SizeType.Ultra: 28,
    SizeType.Mega: 37
  };

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
