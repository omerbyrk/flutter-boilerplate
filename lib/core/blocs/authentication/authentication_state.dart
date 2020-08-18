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
class UnAuthenticationState extends AuthenticationState {
  UnAuthenticationState({String token, UserEntity user})
      : super(token: token, user: user);
  UnAuthenticationState.fromOldState(AuthenticationState state,
      {String token, UserEntity user})
      : super(token: token ?? state.token, user: user ?? state.user);
}

class AuthenticationStateOnMessageState extends AuthenticationState
    with BlocOnMessageStateBase {
  AuthenticationStateOnMessageState({String token, UserEntity user})
      : super(token: token, user: user);
  AuthenticationStateOnMessageState.fromOldState(AuthenticationState state,
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
class InAuthenticationState extends AuthenticationState {
  InAuthenticationState({String token, UserEntity user})
      : super(token: token, user: user);
  InAuthenticationState.fromOldState(AuthenticationState state,
      {String token, UserEntity user})
      : super(token: token ?? state.token, user: user ?? state.user);
}
