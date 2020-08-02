import 'dart:async';

import '../../datasources/locale/models/user_model.dart';
import '../bases/bloc_event_base.dart';
import 'index.dart';

abstract class AuthenticationEvent
    extends BlocEventBase<AuthenticationState, AuthenticationBloc> {
}

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
    UserModel user = await bloc.userDataSource.getBy(token);
    yield InAuthentication(token: token, user: user);
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
      yield AuthenticationStateOnMessage.fromOldState(currentState,
          message: "Your informations are fetching");
      UserModel user = await bloc.userDataSource.getBy(token);
      yield InAuthentication(token: token, user: user);
    } else {
      yield UnAuthentication(user: null, token: null);
    }
  }
}
