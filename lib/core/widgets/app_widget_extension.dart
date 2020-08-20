import 'package:flushbar/flushbar_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../blocs/bases/bloc_state_base.dart';
import '../consts/enums.dart';
import '../localization/app_localizations.dart';
import '../theme/app_colors.dart';
import '../utils/screen_utils.dart';
import 'app_circular_progress_indicator.dart';

/// It is a helpful functions which should be available on [StatelessWidget] and [StatefulWidget]
extension AppWidgetExtension on Widget {
  /// [_screenUtils] return the instance of [ScreenUtils] for reponsiveness.
  ScreenUtils get _screenUtils => GetIt.instance.get<ScreenUtils>();

  /// [_appLocalizations] return the instance of [AppLocalizations] for localizations.
  AppLocalizations get _appLocalizations =>
      GetIt.instance.get<AppLocalizations>();

  /// Localize the key from the [languageCode].json file.
  /// You can custumize the localized string with [params] list
  /// The value in [params] list is replaces with localized string formatted sections like '{0}', '{1}' so on.
  String t(String key, {List<String> params}) =>
      _appLocalizations.translate(key, params: params);

  /// Translate the [text] from google translator.
  Future<String> tg(String text) async =>
      await _appLocalizations.translateFromGoogle(text);

  /// [getWidth] is short way the calculate width by context
  double getWidth<T>(BuildContext context, {double percent = 1}) {
    return MediaQuery.of(context).size.width * percent;
  }

  /// [getHeight] is short way the calculate height by context
  double getHeight<T>(BuildContext context, {double percent = 1}) {
    return MediaQuery.of(context).size.height * percent;
  }

  /// [getFontSize] returns fonts size depends on chosen [SizeType]
  double getFontSize(SizeType type) {
    return this._screenUtils.getFontSize(type);
  }

  /// [getIconSize] returns icon size depends on chosen [SizeType]
  double getIconSize(SizeType type) {
    return this._screenUtils.getIconSize(type);
  }

  /// [convertSize] converts given [size] by the user device size via basic math operations.
  double convertSize(double size) {
    return this._screenUtils.convertToDeviceSize(size);
  }

  /// [navPush] is short way the push [widget] on route
  void navPush(BuildContext context, Widget widget) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => widget),
    );
  }

  void doDelayedTask(Function function, {Duration duration: Duration.zero}) {
    if (function == null) return;

    Future.delayed(duration, function);
  }

  /// [showErrorMessage] show error [message] on the screen
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

  /// [showInformationMessage] show information [message] on the screen
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

  /// [showSuccessMessage] show success [message] on the screen
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

  /// [showMessage] [message] by the chosen [type] on the screen
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

  /// [blocMessageBuilder] listens the given [bloc].
  /// If the bloc's state is [BlocOnMessageStateBase] then shows the message on the sceeen
  BlocBuilder blocMessageBuilder(BuildContext context, Bloc bloc) {
    return BlocBuilder(
        cubit: bloc,
        builder: (_, state) {
          if (state is BlocOnMessageStateBase)
            return this.showMessage(context, state.message, state.type);
          return Container();
        });
  }

  /// [blocProgressBuilder] listens the given [bloc].
  /// If the bloc's state is [BlocInProgressStateBase] then shows the [AppCircularProgressIndicator] component on the sceeen
  BlocBuilder blocProgressBuilder(BuildContext context, Bloc bloc) {
    return BlocBuilder(
        cubit: bloc,
        builder: (context, state) {
          if ((state is BlocInProgressStateBase)) {
            return Positioned.fill(
              child: Container(
                color: AppColors.black.withOpacity(0.5),
                child: AppCircularProgressIndicator(
                  sizePercent: 0.3,
                  color: AppColors.black,
                ),
              ),
            );
          } else
            return Container();
        });
  }
}
