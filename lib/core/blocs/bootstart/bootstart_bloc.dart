import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';

import '../../../domain/usecases/authentication/get_authenticated_user.dart';
import '../../../domain/usecases/authentication/get_token.dart';
import '../../../domain/usecases/authentication/is_authenticated_user.dart';
import '../../consts/enums.dart';
import '../bases/bloc_base.dart';
import 'index.dart';

class BootstartBloc extends Bloc<BootstartEvent, BootStartState>
    with AppBlocBase {
  final IsAuthenticatedUser isAuthenticatedUser;
  final GetToken getToken;
  final GetAuthenticatedUser getAuthenticatedUser;

  BootstartBloc(
      {@required this.isAuthenticatedUser,
      @required this.getToken,
      @required this.getAuthenticatedUser})
      : super(UnBootstart());

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
