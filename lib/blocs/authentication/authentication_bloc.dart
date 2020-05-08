import 'dart:async';
import 'dart:developer' as developer;

import 'package:bloc/bloc.dart';
import 'package:covid19_app/blocs/authentication/index.dart';
import 'package:covid19_app/blocs/common/bloc_helpers.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  // todo: check singleton for logic in project
  static final AuthenticationBloc _authenticationBlocSingleton =
      AuthenticationBloc._internal();
  factory AuthenticationBloc() {
    return _authenticationBlocSingleton;
  }
  AuthenticationBloc._internal();

  @override
  Future<void> close() async {
    // dispose objects
    await super.close();
  }

  @override
  AuthenticationState get initialState => UnAuthenticationState();

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    yield* event.applyAsync(currentState: state, bloc: this).transform(
          StreamTransformer.fromHandlers(
            handleError: BlocHelpers(
              blocOnMessageStateCreator: (message, type) =>
                  AuthenticationStateOnMessage.fromOldState(state,
                      message: message, type: type),
            ).transformStreamErrors,
          ),
        );
  }
}
