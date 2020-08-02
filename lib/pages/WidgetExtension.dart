import 'package:covid19_app/blocs/common/enums.dart';
import 'package:flushbar/flushbar_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



extension WidgetExtension on Widget {
  double getWidth<T>(BuildContext context, {double percent = 1}) {
    return MediaQuery.of(context).size.width * percent;
  }

  double getHeight<T>(BuildContext context, {double percent = 1}) {
    return MediaQuery.of(context).size.height * percent;
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
          title: 'Bilgilendirme',
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