import 'dart:async';

import '../../../domain/entities/user_entity.dart';
import '../../../domain/usecases/usecase.dart';
import '../bases/bloc_event_base.dart';
import '../bootstart/bootstart_bloc.dart';
import '../bootstart/bootstart_event.dart';
import 'index.dart';

class AuthenticationEvent
    extends BlocEventBase<AuthenticationState, AuthenticationBloc> {
  AuthenticationEvent({AuthenticationState toState}) : super(toState: toState);
}

/// If user authenticated before, then yields [InAuthenticationState].
/// Otherwise, yields [UnAuthenticationState]
/// [LoadAuthenticationEvent] calls after user login.
class LoadAuthenticationEvent extends AuthenticationEvent {
  LoadAuthenticationEvent();

  @override
  Stream<AuthenticationState> applyAsync(
      {AuthenticationState currentState, AuthenticationBloc bloc}) async* {
    final resultUser = await bloc.getAuthenticatedUser(NoParams());
    UserEntity userEntity = bloc.extractEither(resultUser);
    if (userEntity != null) {
      String token =
          bloc.extractEither<String>(await bloc.getUserToken(NoParams()));
      yield InAuthenticationState(user: userEntity, token: token);
    } else {
      await Future.delayed(Duration(seconds: 1));
      yield UnAuthenticationState();
    }
  }
}

/// [BootStartLoadAuthenticationEvent] is used for setting the authenticated user
/// [BootStartLoadAuthenticationEvent] is called by [BootStartBloc] via [LoadBootStartEvent]
class BootStartLoadAuthenticationEvent extends AuthenticationEvent {
  /// Authenticated User
  final UserEntity user;

  /// Its token
  final String token;
  BootStartLoadAuthenticationEvent({this.user, this.token});

  @override
  Stream<AuthenticationState> applyAsync(
      {AuthenticationState currentState, AuthenticationBloc bloc}) async* {
    yield InAuthenticationState(user: user, token: token);
  }
}

/// [AuthenticationLogoutEvent] is used for logout user.
/// [AuthenticationLogoutEvent] will delete clear token, and yield [UnAuthenticationState]
class AuthenticationLogoutEvent extends AuthenticationEvent {
  AuthenticationLogoutEvent();

  @override
  Stream<AuthenticationState> applyAsync(
      {AuthenticationState currentState, AuthenticationBloc bloc}) async* {
    yield AuthenticationOnMessageState.fromOldState(currentState,
        message: t("exiting"));
    await bloc.clearUserToken(NoParams());
    await Future.delayed(Duration(seconds: 1));
    yield UnAuthenticationState(token: null, user: null);
  }
}
