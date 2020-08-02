import 'dart:async';
import 'package:covid19_app/blocs/authentication/index.dart';
import 'package:covid19_app/blocs/bootstart/index.dart';
import 'package:covid19_app/blocs/common/bloc_event_bases.dart';

abstract class BootstartEvent
    extends BlocEventBase<Bootstart, BootstartBloc> {}

class LoadBootstartEvent extends BootstartEvent {
  AuthenticationBloc authenticationBloc;

  LoadBootstartEvent({this.authenticationBloc});

  @override
  Stream<Bootstart> applyAsync(
      {Bootstart currentState, BootstartBloc bloc}) async* {
    yield BootstartStateOnMessage.fromOldSettingState(
        message: "Application Starting");
    await Future.delayed(Duration(seconds: 2));
    yield BootstartStateOnMessage.fromOldSettingState(
        message: "Looking for authentication");
    await Future.delayed(Duration(seconds: 2));
    this.authenticationBloc.add(AuthenticationControlEvent());
    yield BootStartIsOver();
  }
}
