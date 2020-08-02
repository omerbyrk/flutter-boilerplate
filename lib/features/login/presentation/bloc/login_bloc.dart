import 'dart:async';

import 'package:bloc/bloc.dart';

import '../../../../core/bloc/utils/bloc_helpers.dart';
import 'index.dart';

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
