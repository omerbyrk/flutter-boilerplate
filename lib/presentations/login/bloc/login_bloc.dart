import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';

import '../../../core/blocs/bases/bloc_base.dart';
import '../../../core/blocs/utils/enums.dart';
import '../../../domain/usecases/authentication/set_token.dart';
import '../../../domain/usecases/user/do_login.dart';
import 'index.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> with AppBlocBase {
  final DoLogin doLogin;
  final SetToken setToken;

  LoginBloc({@required this.doLogin, @required this.setToken})
      : super(UnLogin());

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    yield* event.applyAsync(currentState: state, bloc: this);
  }

  @override
  void toOnMessageState(String message, MessageType type) {
    this.add(
      LoginEvent(
        toState:
            LoginOnMessage.fromOldState(state, type: type, message: message),
      ),
    );
  }
}
