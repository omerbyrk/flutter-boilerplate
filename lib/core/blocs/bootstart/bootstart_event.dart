import 'dart:async';

import 'package:get_it/get_it.dart';

import '../../../domain/entities/user_entity.dart';
import '../../../domain/usecases/usecase.dart';
import '../authentication/index.dart';
import '../bases/bloc_event_base.dart';
import 'index.dart';

class BootstartEvent extends BlocEventBase<BootStartState, BootStartBloc> {
  BootstartEvent({BootStartState toState}) : super(toState: toState);
}

/// [LoadBootStartEvent] is used for booting start the app essentials in the begining.
/// [LoadBootStartEvent] fetchs Movie list from the API to local If not before, and authenticates user If has token
class LoadBootStartEvent extends BootstartEvent {
  @override
  Stream<BootStartState> applyAsync(
      {BootStartState currentState, BootStartBloc bloc}) async* {
    yield BootstartStateOnMessageState.fromOldSettingState(
        message: t("app_starting"));
    await Future.delayed(Duration(seconds: 2));

    bool isLocalMovieListEmpty =
        bloc.extractEither(await bloc.isLocalMovieEmpty(NoParams()));
    if (isLocalMovieListEmpty) {
      if (await bloc.connectivityUtils.isDeviceOnline) {
        var movieSyncResult =
            bloc.extractEither(await bloc.movieBootstartSync(NoParams()));
        if (movieSyncResult == null) {
          return;
        }
      } else {
        yield BootstartStateOnMessageState.fromOldSettingState(
            message: t("need_network_connection"));
        return;
      }
    }

    yield BootstartStateOnMessageState.fromOldSettingState(
        message: t("looking_authentication"));
    await Future.delayed(Duration(seconds: 1));
    bool isAuthenticated =
        bloc.extractEither(await bloc.isAuthenticatedUser(NoParams()));

    if (isAuthenticated) {
      yield BootstartStateOnMessageState.fromOldSettingState(
          message: t("fetching_info"));
      String token =
          bloc.extractEither<String>(await bloc.getToken(NoParams()));
      UserEntity userEntity = bloc.extractEither<UserEntity>(
          await bloc.getAuthenticatedUser(NoParams()));
      yield BootstartStateOnMessageState.fromOldSettingState(
          message: t("redirecting_to_page", params: ["home"]));
      GetIt.instance.get<AuthenticationBloc>().add(
          BootStartLoadAuthenticationEvent(user: userEntity, token: token));
      await Future.delayed(Duration(seconds: 1));
    } else {
      yield BootstartStateOnMessageState.fromOldSettingState(
          message: t("redirecting_to_page", params: ["login"]));
      await Future.delayed(Duration(seconds: 1));
    }
    yield BootStartIsOverState();
  }
}
