import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:covid19_app/blocs/authentication/index.dart';
import 'package:covid19_app/blocs/common/bloc_helpers.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc() : super(UnAuthentication());

  @override
  Future<void> close() async {
    // dispose objects
    await super.close();
  }

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
