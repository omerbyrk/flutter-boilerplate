import 'dart:async';

import 'package:meta/meta.dart';

import '../../../core/blocs/utils/enums.dart';
import '../../../domain/usecases/user/do_login.dart';
import 'index.dart';

@immutable
abstract class LoginEvent {
  Stream<LoginState> applyAsync({LoginState currentState, LoginBloc bloc});
}

class LoadLoginEvent extends LoginEvent {
  final String username;
  final String password;

  LoadLoginEvent(this.username, this.password);

  @override
  Stream<LoginState> applyAsync(
      {LoginState currentState, LoginBloc bloc}) async* {
    yield LoginOnProgress.fromOldState(currentState);
    var loginResult = await bloc.doLogin(Params(username, password));
    yield loginResult.fold(
        (l) => LoginOnMessage.fromOldState(currentState,
            message: l.message, type: MessageType.ERROR),
        (r) => InLoginState.fromOldState(currentState, token: r));
  }
}
