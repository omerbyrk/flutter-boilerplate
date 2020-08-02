import 'dart:async';

import 'package:covid19_app/core/blocs/utils/enums.dart';
import 'package:covid19_app/domain/usecases/user/get_by_token.dart';

import '../bases/bloc_event_base.dart';
import 'index.dart';

abstract class AuthenticationEvent
    extends BlocEventBase<AuthenticationState, AuthenticationBloc> {}

class UnAuthenticationEvent extends AuthenticationEvent {
  @override
  Stream<AuthenticationState> applyAsync(
      {AuthenticationState currentState, AuthenticationBloc bloc}) async* {
    // token will be deleted!
    yield UnAuthentication(user: null, token: null);
  }
}

class LoadAuthenticationEvent extends AuthenticationEvent {
  final String token;

  LoadAuthenticationEvent(this.token);

  @override
  Stream<AuthenticationState> applyAsync(
      {AuthenticationState currentState, AuthenticationBloc bloc}) async* {
    yield AuthenticationStateOnMessage.fromOldState(currentState,
        message: "Your informations are fetching");
    final tokenResult = await bloc.getByToken(Params(token));
    yield* tokenResult.fold<Stream<AuthenticationState>>((failure) async* {
      yield AuthenticationStateOnMessage.fromOldState(currentState,
          message: failure.message, type: MessageType.ERROR);
      await Future.delayed(Duration(seconds: 2));
      yield UnAuthentication.fromOldState(currentState);
    }, (user) async* {
      yield InAuthentication(token: token, user: user);
    });
  }
}

class AuthenticationControlEvent extends AuthenticationEvent {
  AuthenticationControlEvent();

  @override
  Stream<AuthenticationState> applyAsync(
      {AuthenticationState currentState, AuthenticationBloc bloc}) async* {
    // look for token.
    String token;
    if (token != null) {
      bloc.add(LoadAuthenticationEvent(token));
    } else {
      yield UnAuthentication(user: null, token: null);
    }
  }
}
