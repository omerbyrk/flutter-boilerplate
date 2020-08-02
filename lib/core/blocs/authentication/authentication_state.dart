import 'package:covid19_app/core/blocs/bases/bloc_state_base.dart';
import 'package:covid19_app/core/datasources/locale/models/user_model.dart';
import 'package:flutter/foundation.dart';

import '../utils/enums.dart';

abstract class AuthenticationState {
  final String token;
  final UserModel user;
  AuthenticationState({this.token, this.user});
}

/// UnInitialized
class UnAuthentication extends AuthenticationState {
  UnAuthentication({String token, UserModel user})
      : super(token: token, user: user);
  UnAuthentication.fromOldState(AuthenticationState state,
      {String token, UserModel user})
      : super(token: token ?? state.token, user: user ?? state.user);
}

class AuthenticationStateOnMessage extends AuthenticationState
    with BlocOnMessageStateBase {
  AuthenticationStateOnMessage({String token, UserModel user})
      : super(token: token, user: user);
  AuthenticationStateOnMessage.fromOldState(AuthenticationState state,
      {String token,
      UserModel user,
      @required String message,
      type = MessageType.INFO})
      : super(token: token ?? state.token, user: user ?? state.user) {
    this.message = message;
    this.type = type;
  }
}

/// Initialized
class InAuthentication extends AuthenticationState {
  InAuthentication({String token, UserModel user})
      : super(token: token, user: user);
  InAuthentication.fromOldState(AuthenticationState state,
      {String token, UserModel user})
      : super(token: token ?? state.token, user: user ?? state.user);
}
