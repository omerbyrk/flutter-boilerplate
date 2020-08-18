import 'package:flutter/foundation.dart';

import '../../../core/blocs/bases/bloc_state_base.dart';
import '../../../core/consts/enums.dart';

// ignore: must_be_immutable
abstract class LoginState {
  LoginState();
}

// ignore: must_be_immutable
class UnLoginState extends LoginState {
  UnLoginState();

  UnLoginState.fromOldState(LoginState loginState);
}

/// UnInitialized
// ignore: must_be_immutable
class LoginOnProgressState extends LoginState with BlocInProgressStateBase {
  LoginOnProgressState();

  LoginOnProgressState.fromOldState(LoginState loginState);
}

/// Initialized
// ignore: must_be_immutable
class InLoginStateState extends LoginState {
  InLoginStateState();

  InLoginStateState.fromOldState(LoginState loginState);
}

// ignore: must_be_immutable
class LoginOnMessageState extends LoginState with BlocOnMessageStateBase {
  LoginOnMessageState();

  LoginOnMessageState.fromOldState(LoginState loginState,
      {@required String message, MessageType type = MessageType.INFO}) {
    this.message = message;
    this.type = type;
  }
}
