import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:covid19_app/blocs/common/bloc_helpers.dart';
import 'package:covid19_app/blocs/login/index.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {

  LoginBloc() : super(UnLogin());

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    yield* event.applyAsync(currentState: state, bloc: this).transform(
          StreamTransformer.fromHandlers(
            handleError: BlocHelpers(
              blocOnMessageStateCreator: (message, type) =>
                  LoginOnMessage.fromOldState(state,
                      message: message, type: type),
            ).transformStreamErrors,
          ),
        );
  }
}
