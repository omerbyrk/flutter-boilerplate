import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';

import '../base/bloc_state_base.dart';
import '../base/../utils/enums.dart';

class BlocHelpers {
  final BlocOnMessageStateBase Function(String, MessageType)
      blocOnMessageStateCreator;

  BlocHelpers({this.blocOnMessageStateCreator});

  void transformStreamErrors(
    Object error,
    StackTrace trace,
    EventSink sink,
  ) {
    if (error == null) return;

    String errorMessage;

    if (error is DioError && error.error is SocketException) {
      errorMessage = "Please check internet connection!";
    } else {
      errorMessage =
          error.toString().split(":").last ?? "There is an expected error!";
    }
    if (blocOnMessageStateCreator == null) {
      print(
          "If you want to show the error to users on the ui, you should set the blocOnMessageStateCreator property!");
      print(error);
      print(trace);
    } else {
      
      sink.add(this.blocOnMessageStateCreator(errorMessage, MessageType.ERROR));
    }
  }
}
