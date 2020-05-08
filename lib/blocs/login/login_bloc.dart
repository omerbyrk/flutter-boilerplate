import 'dart:async';
import 'dart:developer' as developer;

import 'package:bloc/bloc.dart';
import 'package:covid19_app/blocs/common/bloc_helpers.dart';
import 'package:covid19_app/blocs/login/index.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  // todo: check singleton for logic in project
  static final LoginBloc _loginBlocSingleton = LoginBloc._internal();
  factory LoginBloc() {
    return _loginBlocSingleton;
  }
  LoginBloc._internal();

  @override
  Future<void> close() async {
    // dispose objects
    await super.close();
  }

  @override
  LoginState get initialState => UnLoginState();

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    yield* event.applyAsync(currentState: state, bloc: this).transform(
          StreamTransformer.fromHandlers(
            handleError: BlocHelpers(
              blocOnMessageStateCreator: (message, type) =>
                  LoginStateOnMessage.fromOldState(state,
                      message: message, type: type),
            ).transformStreamErrors,
          ),
        );
  }
}
