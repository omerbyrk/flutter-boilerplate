import 'package:flutter/foundation.dart';

import '../../../domain/entities/user_entity.dart';
import '../../consts/enums.dart';
import '../bases/bloc_state_base.dart';

abstract class AuthenticationState {
  final String token;
  final UserEntity user;
  AuthenticationState({this.token, this.user});
}

/// UnInitialized
class UnAuthentication extends AuthenticationState {
  UnAuthentication({String token, UserEntity user})
      : super(token: token, user: user);
  UnAuthentication.fromOldState(AuthenticationState state,
      {String token, UserEntity user})
      : super(token: token ?? state.token, user: user ?? state.user);
}

class AuthenticationStateOnMessage extends AuthenticationState
    with BlocOnMessageStateBase {
  AuthenticationStateOnMessage({String token, UserEntity user})
      : super(token: token, user: user);
  AuthenticationStateOnMessage.fromOldState(AuthenticationState state,
      {String token,
      UserEntity user,
      @required String message,
      type = MessageType.INFO})
      : super(token: token ?? state.token, user: user ?? state.user) {
    this.message = message;
    this.type = type;
  }
}

/// Initialized
class InAuthentication extends AuthenticationState {
  InAuthentication({String token, UserEntity user})
      : super(token: token, user: user);
  InAuthentication.fromOldState(AuthenticationState state,
      {String token, UserEntity user})
      : super(token: token ?? state.token, user: user ?? state.user);
}
