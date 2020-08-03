import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:covid19_app/core/blocs/bases/bloc_base.dart';
import 'package:covid19_app/core/blocs/utils/enums.dart';
import 'package:covid19_app/domain/usecases/authentication/clear_token.dart';
import 'package:covid19_app/domain/usecases/authentication/get_token.dart';
import 'package:flutter/foundation.dart';

import '../../../domain/usecases/authentication/get_authenticated_user.dart';
import 'index.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState>
    with AppBlocBase {
  ClearUserToken clearUserToken;
  GetAuthenticatedUser getAuthenticatedUser;
  GetToken getToken;
  AuthenticationBloc(
      {@required this.getAuthenticatedUser,
      @required this.getToken,
      @required this.clearUserToken})
      : super(UnAuthentication());

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
        toState: AuthenticationStateOnMessage.fromOldState(state,
            message: message, type: type)));
  }
}
