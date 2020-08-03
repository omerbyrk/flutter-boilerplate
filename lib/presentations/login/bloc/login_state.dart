import 'package:covid19_app/core/blocs/bases/bloc_state_base.dart';
import 'package:covid19_app/core/blocs/utils/enums.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

// ignore: must_be_immutable
abstract class LoginState {
  LoginState();
}

// ignore: must_be_immutable
class UnLogin extends LoginState {
  UnLogin();

  UnLogin.fromOldState(LoginState loginState);
}

/// UnInitialized
// ignore: must_be_immutable
class LoginOnProgress extends LoginState with BlocInProgressStateBase {
  LoginOnProgress() ;

  LoginOnProgress.fromOldState(LoginState loginState);
    
}

/// Initialized
// ignore: must_be_immutable
class InLoginState extends LoginState {
  InLoginState();

  InLoginState.fromOldState(LoginState loginState);
}

// ignore: must_be_immutable
class LoginOnMessage extends LoginState with BlocOnMessageStateBase {
  LoginOnMessage() ;

  LoginOnMessage.fromOldState(LoginState loginState,
      {String token, @required String message, type = MessageType.INFO});
}
