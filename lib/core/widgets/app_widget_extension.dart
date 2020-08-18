import 'package:flushbar/flushbar_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../consts/enums.dart';
import '../localization/app_localizations.dart';
import '../utils/screen_utils.dart';

extension AppWidgetExtension on Widget {
  ScreenUtils get _screenUtils => GetIt.instance.get<ScreenUtils>();

  AppLocalizations get _appLocalizations =>
      GetIt.instance.get<AppLocalizations>();

  String t(String key, {List<String> params}) =>
      _appLocalizations.translate(key, params: params);

  Future<String> tg(String text) async =>
      await _appLocalizations.translateFromGoogle(text);

  double getWidth<T>(BuildContext context, {double percent = 1}) {
    return MediaQuery.of(context).size.width * percent;
  }

  double getHeight<T>(BuildContext context, {double percent = 1}) {
    return MediaQuery.of(context).size.height * percent;
  }

  double getFontSize(SizeType type) {
    return this._screenUtils.getFontSize(type);
  }

  double getIconSize(SizeType type) {
    return this._screenUtils.getIconSize(type);
  }

  double convertSize(double size) {
    return this._screenUtils.convertToDeviceSize(size);
  }

  void navPush(BuildContext context, Widget widget) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => widget),
    );
  }

  void doDelayedTask(Function function, {Duration duration: Duration.zero}) {
    if (function == null) return;

    Future.delayed(duration, function);
  }

  showErrorMessage(BuildContext context, String message) {
    if (message != null) {
      doDelayedTask(() {
        FlushbarHelper.createError(
          message: message,
          title: 'Heyyy!',
          duration: Duration(seconds: 3),
        )..show(context);
      });
    }
    return Container();
  }

  showInformationMessage(BuildContext context, String message) {
    if (message != null) {
      doDelayedTask(() {
        FlushbarHelper.createInformation(
          message: message,
          title: 'Notify',
          duration: Duration(seconds: 3),
        )..show(context);
      });
    }
    return Container();
  }

  showSuccessMessage(BuildContext context, String message) {
    if (message != null) {
      doDelayedTask(() {
        FlushbarHelper.createSuccess(
          message: message,
          title: 'Yeapp! :)',
          duration: Duration(seconds: 3),
        )..show(context);
      });
    }
    return Container();
  }

  Widget showMessage(BuildContext context, String message, MessageType type) {
    switch (type) {
      case MessageType.SUCCESS:
        return showSuccessMessage(context, message);
      case MessageType.ERROR:
        return showErrorMessage(context, message);
      case MessageType.INFO:
        return showInformationMessage(context, message);
      default:
        return Container();
    }
  }
}
