import 'dart:async';

import '../authentication/index.dart';
import '../base/bloc_event_base.dart';
import 'index.dart';


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
