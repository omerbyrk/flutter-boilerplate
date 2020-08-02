import 'dart:async';

import '../../../model/user.dart';
import '../../../network/providers/user_provider.dart';
import '../base/bloc_event_base.dart';
import 'index.dart';

abstract class AuthenticationEvent
    extends BlocEventBase<AuthenticationState, AuthenticationBloc> {
  UserProvider userProvider = UserProvider();
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
    User user = await userProvider.getBy(token);
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
      User user = await userProvider.getBy(token);
      yield InAuthentication(token: token, user: user);
    } else {
      yield UnAuthentication(user: null, token: null);
    }
  }
}
