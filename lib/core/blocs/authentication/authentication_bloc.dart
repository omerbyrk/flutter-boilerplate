import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/usecases/authentication/clear_token.dart';
import '../../../domain/usecases/user/get_user_by_token.dart';
import '../../../domain/usecases/authentication/get_token.dart';
import '../../consts/enums.dart';
import '../bases/bloc_base.dart';
import 'index.dart';

@lazySingleton
class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState>
    with AppBlocBase {
  ClearUserToken clearUserToken;
  GetUserByToken getAuthenticatedUser;
  GetUserToken getUserToken;
  AuthenticationBloc(
      {@required this.getAuthenticatedUser,
      @required this.getUserToken,
      @required this.clearUserToken})
      : super(UnAuthenticationState());

  @override
  Future<void> close() async {
    // dispose objects
    await super.close();
  }

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    yield* event.applyAsync(currentState: state, bloc: this);
  }

  @override
  void toOnMessageState(String message, MessageType type) {
    this.add(AuthenticationEvent(
        toState: AuthenticationOnMessageState.fromOldState(state,
            message: message, type: type)));
  }
}
