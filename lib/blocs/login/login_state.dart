import 'package:covid19_app/blocs/common/bloc_state_bases.dart';
import 'package:covid19_app/blocs/common/enums.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

abstract class LoginState extends Equatable {
  String token;
  LoginState({this.token});
}

class UnLoginState extends LoginState {
  UnLoginState({token}) : super(token: token);

  UnLoginState.fromOldState(LoginState loginState, {String token})
      : super(token: token ?? loginState.token);

  @override
  // TODO: implement props
  List<Object> get props => [token];
}

/// UnInitialized
class LoginStateInProgress extends LoginState with BlocInProgressStateBase {
  LoginStateInProgress({token}) : super(token: token);

  LoginStateInProgress.fromOldState(LoginState loginState, {String token})
      : super(token: token ?? loginState.token);

  @override
  // TODO: implement props
  List<Object> get props => [token];
}

/// Initialized
class LoginStateLoadded extends LoginState {
  LoginStateLoadded({token}) : super(token: token);

  LoginStateLoadded.fromOldState(LoginState loginState, {String token})
      : super(token: token ?? loginState.token);

  @override
  // TODO: implement props
  List<Object> get props => [token];
}

@immutable
class LoginStateOnMessage extends LoginState with BlocOnMessageStateBase {
  LoginStateOnMessage({token}) : super(token: token);

  LoginStateOnMessage.fromOldState(LoginState loginState,
      {String token, @required String message, type = MessageType.INFO})
      : super(token: token ?? loginState.token) {
    this.message = message;
    this.type = type;
  }

  @override
  // TODO: implement props
  List<Object> get props => [token, message, type];
}
