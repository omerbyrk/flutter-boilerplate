import 'package:covid19_app/core/localization/app_localizations.dart';
import 'package:covid19_app/core/localization/localization_base.dart';
import 'package:get_it/get_it.dart';

abstract class BlocEventBase<State, Bloc> extends Localization {
  final State toState;
  BlocEventBase({this.toState});
  Stream<State> applyAsync({State currentState, Bloc bloc}) async* {
    yield toState ?? currentState;
  }
}
