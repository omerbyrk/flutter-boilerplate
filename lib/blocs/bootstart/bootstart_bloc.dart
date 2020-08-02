import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:covid19_app/blocs/bootstart/index.dart';
import 'package:covid19_app/blocs/common/bloc_helpers.dart';

class BootstartBloc extends Bloc<BootstartEvent, Bootstart> {

  BootstartBloc() : super(UnBootstart());
  
  @override
  Stream<Bootstart> mapEventToState(
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
