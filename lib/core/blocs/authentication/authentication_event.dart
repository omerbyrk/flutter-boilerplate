import 'dart:async';

import '../../../domain/entities/user_entity.dart';
import '../../../domain/usecases/usecase.dart';
import '../bases/bloc_event_base.dart';
import 'index.dart';

class AuthenticationEvent
    extends BlocEventBase<AuthenticationState, AuthenticationBloc> {
  AuthenticationEvent({AuthenticationState toState}) : super(toState: toState);
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
  LoadAuthenticationEvent();

  @override
  Stream<AuthenticationState> applyAsync(
      {AuthenticationState currentState, AuthenticationBloc bloc}) async* {
    final resultUser = await bloc.getAuthenticatedUser(NoParams());
    UserEntity userEntity = bloc.extractEither(resultUser);
    if (userEntity != null) {
      String token =
          bloc.extractEither<String>(await bloc.getToken(NoParams()));
      yield InAuthentication(user: userEntity, token: token);
    } else {
      await Future.delayed(Duration(seconds: 1));
      yield UnAuthentication();
    }
  }
}

class BootStartLoadAuthenticationEvent extends AuthenticationEvent {
  final UserEntity user;
  final String token;
  BootStartLoadAuthenticationEvent({this.user, this.token});

  @override
  Stream<AuthenticationState> applyAsync(
      {AuthenticationState currentState, AuthenticationBloc bloc}) async* {
    yield InAuthentication(user: user, token: token);
  }
}

class AuthenticationLogoutEvent extends AuthenticationEvent {
  AuthenticationLogoutEvent();

  @override
  Stream<AuthenticationState> applyAsync(
      {AuthenticationState currentState, AuthenticationBloc bloc}) async* {
    yield AuthenticationStateOnMessage.fromOldState(currentState,
        message: t("exiting"));
    await bloc.clearUserToken(NoParams());
    await Future.delayed(Duration(seconds: 1));
    yield UnAuthentication(token: null, user: null);
  }
}
