import 'dart:async';

import 'package:covid19_app/core/blocs/bases/bloc_event_base.dart';
import 'package:covid19_app/domain/entities/user_entity.dart';
import 'package:covid19_app/domain/usecases/usecase.dart';
import 'package:get_it/get_it.dart';

import '../authentication/index.dart';
import 'index.dart';

class BootstartEvent extends BlocEventBase<BootStartState, BootstartBloc> {
  BootstartEvent({BootStartState toState}) : super(toState: toState);
}

class LoadBootstartEvent extends BootstartEvent {
  @override
  Stream<BootStartState> applyAsync(
      {BootStartState currentState, BootstartBloc bloc}) async* {
    yield BootstartStateOnMessage.fromOldSettingState(
        message: "Application Starting");
    await Future.delayed(Duration(seconds: 2));

    yield BootstartStateOnMessage.fromOldSettingState(
        message: "Looking for authentication");
    await Future.delayed(Duration(seconds: 1));

    bool isAuthenticated =
        bloc.extractEither(await bloc.isAuthenticatedUser(NoParams()));

    if (isAuthenticated) {
      yield BootstartStateOnMessage.fromOldSettingState(
          message: "Fetching Info");
      String token =
          bloc.extractEither<String>(await bloc.getToken(NoParams()));
      UserEntity userEntity = bloc.extractEither<UserEntity>(
          await bloc.getAuthenticatedUser(NoParams()));
      yield BootstartStateOnMessage.fromOldSettingState(
          message: "Redirecting to home page");
      GetIt.instance.get<AuthenticationBloc>().add(
          BootStartLoadAuthenticationEvent(user: userEntity, token: token));
      await Future.delayed(Duration(seconds: 1));
    } else {
      yield BootstartStateOnMessage.fromOldSettingState(
          message: "Redirecting to login page");
      await Future.delayed(Duration(seconds: 1));
    }
    yield BootStartIsOver();
  }
}
