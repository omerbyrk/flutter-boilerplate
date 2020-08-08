import 'dart:async';

import 'package:get_it/get_it.dart';

import '../../../domain/entities/user_entity.dart';
import '../../../domain/usecases/usecase.dart';
import '../authentication/index.dart';
import '../bases/bloc_event_base.dart';
import 'index.dart';

class BootstartEvent extends BlocEventBase<BootStartState, BootstartBloc> {
  BootstartEvent({BootStartState toState}) : super(toState: toState);
}

class LoadBootstartEvent extends BootstartEvent {
  @override
  Stream<BootStartState> applyAsync(
      {BootStartState currentState, BootstartBloc bloc}) async* {
    yield BootstartStateOnMessage.fromOldSettingState(
        message: t("app_starting"));
    await Future.delayed(Duration(seconds: 2));

    yield BootstartStateOnMessage.fromOldSettingState(
        message: t("looking_authentication"));
    await Future.delayed(Duration(seconds: 1));

    bool isAuthenticated =
        bloc.extractEither(await bloc.isAuthenticatedUser(NoParams()));

    if (isAuthenticated) {
      yield BootstartStateOnMessage.fromOldSettingState(
          message: t("fetching_info"));
      String token =
          bloc.extractEither<String>(await bloc.getToken(NoParams()));
      UserEntity userEntity = bloc.extractEither<UserEntity>(
          await bloc.getAuthenticatedUser(NoParams()));
      yield BootstartStateOnMessage.fromOldSettingState(
          message: t("redirecting_to_page", params: ["home"]));
      GetIt.instance.get<AuthenticationBloc>().add(
          BootStartLoadAuthenticationEvent(user: userEntity, token: token));
      await Future.delayed(Duration(seconds: 1));
    } else {
      yield BootstartStateOnMessage.fromOldSettingState(
          message: t("redirecting_to_page", params: ["login"]));
      await Future.delayed(Duration(seconds: 1));
    }
    yield BootStartIsOver();
  }
}
