import 'dart:async';

import 'package:meta/meta.dart';

import '../../../core/blocs/bases/bloc_event_base.dart';
import '../../../domain/usecases/authentication/set_token.dart' as st;
import '../../../domain/usecases/user/do_login.dart' as dl;
import 'index.dart';

@immutable
class LoginEvent extends BlocEventBase<LoginState, LoginBloc> {
  LoginEvent({LoginState toState}) : super(toState: toState);
}

class LoadLoginEvent extends LoginEvent {
  final String username;
  final String password;

  LoadLoginEvent(this.username, this.password);

  @override
  Stream<LoginState> applyAsync(
      {LoginState currentState, LoginBloc bloc}) async* {
    yield LoginOnProgressState.fromOldState(currentState);
    var loginResult = await bloc.doLogin(dl.Params(username, password));
    String token = bloc.extractEither<String>(loginResult);
    if (token != null) {
      bloc.extractEither<void>(await bloc.setToken(st.Params(token)));
      await Future.delayed(Duration(seconds: 1));
      yield InLoginStateState();
    }
  }
}
