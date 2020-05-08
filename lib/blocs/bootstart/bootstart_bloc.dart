import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:covid19_app/blocs/bootstart/index.dart';
import 'package:covid19_app/blocs/common/bloc_helpers.dart';
import 'package:covid19_app/blocs/home/index.dart';

class BootstartBloc extends Bloc<BootstartEvent, BootstartState> {
  // todo: check singleton for logic in project
  static final BootstartBloc _bootstartBlocSingleton =
      BootstartBloc._internal();
  factory BootstartBloc() {
    return _bootstartBlocSingleton;
  }
  BootstartBloc._internal();

  @override
  Future<void> close() async {
    // dispose objects
    await _bootstartBlocSingleton.close();
    await super.close();
  }

  @override
  BootstartState get initialState => UnBootstartState();

  @override
  Stream<BootstartState> mapEventToState(
    BootstartEvent event,
  ) async* {
    yield* event.applyAsync(currentState: state, bloc: this).transform(
          StreamTransformer.fromHandlers(
            handleError: BlocHelpers(
              blocOnMessageStateCreator: (message, type) =>
                  BootstartStateOnMessage.fromOldSettingState(
                      message: message, type: type),
            ).transformStreamErrors,
          ),
        );
  }
}
