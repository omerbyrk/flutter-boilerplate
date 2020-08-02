import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:covid19_app/core/blocs/authentication/index.dart';

import '../utils/bloc_helpers.dart';
import 'index.dart';

class BootstartBloc extends Bloc<BootstartEvent, BootStartState> {

  final AuthenticationBloc authenticationBloc;

  BootstartBloc({this.authenticationBloc}) : super(UnBootstart());
  
  @override
  Stream<BootStartState> mapEventToState(
    BootstartEvent event,
  ) async* {
    yield* event.applyAsync(currentState: state, bloc: this);
  }
}
