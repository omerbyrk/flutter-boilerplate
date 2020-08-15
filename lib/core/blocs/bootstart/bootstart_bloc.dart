import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:covid19_app/core/utils/connectivity_utils.dart';
import 'package:covid19_app/domain/usecases/movie/is_local_movie_empty.dart';
import 'package:covid19_app/domain/usecases/movie/movie_bootstart_sync.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/usecases/authentication/get_authenticated_user.dart';
import '../../../domain/usecases/authentication/get_token.dart';
import '../../../domain/usecases/authentication/is_authenticated_user.dart';
import '../../consts/enums.dart';
import '../bases/bloc_base.dart';
import 'index.dart';

@lazySingleton
class BootstartBloc extends Bloc<BootstartEvent, BootStartState>
    with AppBlocBase {
  final ConnectivityUtils connectivityUtils;
  final IsAuthenticatedUser isAuthenticatedUser;
  final GetUserToken getToken;
  final GetAuthenticatedUser getAuthenticatedUser;
  final IsLocalMovieEmpty isLocalMovieEmpty;
  final MovieBootstartSync movieBootstartSync;

  BootstartBloc({
    @required this.connectivityUtils,
    @required this.isAuthenticatedUser,
    @required this.getToken,
    @required this.getAuthenticatedUser,
    @required this.isLocalMovieEmpty,
    @required this.movieBootstartSync,
  }) : super(UnBootstart());

  @override
  Stream<BootStartState> mapEventToState(
    BootstartEvent event,
  ) async* {
    yield* event.applyAsync(currentState: state, bloc: this);
  }

  @override
  void toOnMessageState(String message, MessageType type) {
    this.add(BootstartEvent(
        toState: BootstartStateOnMessage.fromOldSettingState(
            message: message, type: type)));
  }
}
