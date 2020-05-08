import 'package:covid19_app/blocs/common/bloc_state_bases.dart';
import 'package:covid19_app/blocs/common/enums.dart';
import 'package:covid19_app/model/User.dart';
import 'package:flutter/foundation.dart';

abstract class AuthenticationState {
  final String token;
  final User user;
  AuthenticationState({this.token, this.user});
}

/// UnInitialized
class UnAuthenticationState extends AuthenticationState {
  UnAuthenticationState({String token, User user})
      : super(token: token, user: user);
  UnAuthenticationState.fromOldState(AuthenticationState state,
      {String token, User user})
      : super(token: token ?? state.token, user: user ?? state.user);
}

class AuthenticationStateOnMessage extends AuthenticationState
    with BlocOnMessageStateBase {
  AuthenticationStateOnMessage({String token, User user})
      : super(token: token, user: user);
  AuthenticationStateOnMessage.fromOldState(AuthenticationState state,
      {String token,
      User user,
      @required String message,
      type = MessageType.INFO})
      : super(token: token ?? state.token, user: user ?? state.user) {
    this.message = message;
    this.type = type;
  }
}

/// Initialized
class InAuthenticationState extends AuthenticationState {
  InAuthenticationState({String token, User user})
      : super(token: token, user: user);
  InAuthenticationState.fromOldState(AuthenticationState state,
      {String token, User user})
      : super(token: token ?? state.token, user: user ?? state.user);
}
