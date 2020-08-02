import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:covid19_app/features/login/domain/repositories/login_repository.dart';
import 'package:covid19_app/features/login/domain/usecases/DoLogin.dart';

import '../../../../core/blocs/utils/bloc_helpers.dart';
import 'index.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {

  final DoLogin doLogin;

  LoginBloc({this.doLogin}) : super(UnLogin());

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
