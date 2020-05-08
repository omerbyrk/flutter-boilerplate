import 'dart:async';
import 'package:covid19_app/blocs/authentication/index.dart';
import 'package:covid19_app/blocs/bootstart/index.dart';
import 'package:covid19_app/blocs/common/bloc_event_bases.dart';
import 'package:meta/meta.dart';

@immutable
abstract class BootstartEvent
    extends BlocEventBase<BootstartState, BootstartBloc> {}

class LoadBootstartEvent extends BootstartEvent {
  AuthenticationBloc authenticationBloc;

  LoadBootstartEvent({this.authenticationBloc});

  @override
  Stream<BootstartState> applyAsync(
      {BootstartState currentState, BootstartBloc bloc}) async* {
    yield BootstartStateOnMessage.fromOldSettingState(
        message: "Application Starting");
    await Future.delayed(Duration(seconds: 2));
    yield BootstartStateOnMessage.fromOldSettingState(
        message: "Looking for authentication");
    await Future.delayed(Duration(seconds: 2));
    this.authenticationBloc.add(AuthenticationControlEvent());
    yield BootStartOverState();
  }
}
