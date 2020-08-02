import 'package:covid19_app/blocs/common/bloc_state_bases.dart';
import 'package:covid19_app/blocs/common/enums.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

// ignore: must_be_immutable
abstract class LoginState extends Equatable {
  String token;
  LoginState({this.token});
}

// ignore: must_be_immutable
class UnLogin extends LoginState {
  UnLogin({token}) : super(token: token);

  UnLogin.fromOldState(LoginState loginState, {String token})
      : super(token: token ?? loginState.token);

  @override
  // TODO: implement props
  List<Object> get props => [token];
}

/// UnInitialized
// ignore: must_be_immutable
class LoginOnProgress extends LoginState with BlocInProgressStateBase {
  LoginOnProgress({token}) : super(token: token);

  LoginOnProgress.fromOldState(LoginState loginState, {String token})
      : super(token: token ?? loginState.token);

  @override
  // TODO: implement props
  List<Object> get props => [token];
}

/// Initialized
// ignore: must_be_immutable
class InLoginState extends LoginState {
  InLoginState({token}) : super(token: token);

  InLoginState.fromOldState(LoginState loginState, {String token})
      : super(token: token ?? loginState.token);

  @override
  // TODO: implement props
  List<Object> get props => [token];
}

// ignore: must_be_immutable
class LoginOnMessage extends LoginState with BlocOnMessageStateBase {
  LoginOnMessage({token}) : super(token: token);

  LoginOnMessage.fromOldState(LoginState loginState,
      {String token, @required String message, type = MessageType.INFO})
      : super(token: token ?? loginState.token) {
    this.message = message;
    this.type = type;
  }

  @override
  // TODO: implement props
  List<Object> get props => [token, message, type];
}
