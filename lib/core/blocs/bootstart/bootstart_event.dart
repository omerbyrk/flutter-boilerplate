import 'dart:async';

import 'package:covid19_app/core/blocs/bases/bloc_event_base.dart';

import '../authentication/index.dart';
import 'index.dart';


abstract class BootstartEvent
    extends BlocEventBase<BootStartState, BootstartBloc> {}

class LoadBootstartEvent extends BootstartEvent {
  @override
  Stream<BootStartState> applyAsync(
      {BootStartState currentState, BootstartBloc bloc}) async* {
    yield BootstartStateOnMessage.fromOldSettingState(
        message: "Application Starting");
    await Future.delayed(Duration(seconds: 2));
    yield BootstartStateOnMessage.fromOldSettingState(
        message: "Looking for authentication");
    await Future.delayed(Duration(seconds: 2));
    bloc.authenticationBloc.add(AuthenticationControlEvent());
    yield BootStartIsOver();
  }
}
