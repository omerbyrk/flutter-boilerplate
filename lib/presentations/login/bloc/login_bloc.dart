import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:covid19_app/domain/repositories/user/user_repository.dart';
import 'package:covid19_app/domain/usecases/user/do_login.dart';

import 'index.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {

  final DoLogin doLogin;

  LoginBloc({this.doLogin}) : super(UnLogin());

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    yield* event.applyAsync(currentState: state, bloc: this);
  }
}
