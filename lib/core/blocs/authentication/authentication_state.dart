import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import '../../../domain/entities/user_entity.dart';
import '../../consts/enums.dart';
import '../bases/bloc_state_base.dart';

class AuthenticationState extends Equatable {
  final String token;
  final UserEntity user;
  AuthenticationState({this.token, this.user});

  @override
  List<Object> get props => [token, user];
}

/// Initial State
class UnAuthenticationState extends AuthenticationState {
  UnAuthenticationState({String token, UserEntity user})
      : super(token: token, user: user);
  UnAuthenticationState.fromOldState(AuthenticationState state,
      {String token, UserEntity user})
      : super(token: token ?? state.token, user: user ?? state.user);
}

// ignore: must_be_immutable
class AuthenticationOnMessageState extends AuthenticationState
    with BlocOnMessageStateBase {
  AuthenticationOnMessageState({String token, UserEntity user})
      : super(token: token, user: user);
  AuthenticationOnMessageState.fromOldState(AuthenticationState state,
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
