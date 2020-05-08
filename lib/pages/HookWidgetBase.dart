import 'package:covid19_app/blocs/common/enums.dart';
import 'package:flushbar/flushbar_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

abstract class HookWidgetBase extends HookWidget {
  double getWidth<T>({double percent = 1}) {
    final context = useContext();
    return MediaQuery.of(context).size.width * percent;
  }

  double getHeight<T>({double percent = 1}) {
    final context = useContext();
    return MediaQuery.of(context).size.height * percent;
  }

  void doDelayedTask(Function function, {Duration duration: Duration.zero}) {
    if (function == null) return;

    Future.delayed(duration, function);
  }

  showErrorMessage(String message) {
    if (message != null) {
      final context = useContext();
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

  showInformationMessage(String message) {
    if (message != null) {
      final context = useContext();
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

  showSuccessMessage(String message) {
    if (message != null) {
      final context = useContext();
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

  Widget showMessage(String message, MessageType type) {
    switch (type) {
      case MessageType.SUCCESS:
        return showSuccessMessage(message);
      case MessageType.ERROR:
        return showErrorMessage(message);
      case MessageType.INFO:
        return showInformationMessage(message);
      default:
        return Container();
    }
  }
}
