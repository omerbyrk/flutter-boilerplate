import '../../localization/localization_base.dart';

abstract class BlocEventBase<State, Bloc> extends Localization {
  final State toState;
  BlocEventBase({this.toState});
  Stream<State> applyAsync({State currentState, Bloc bloc}) async* {
    yield toState ?? currentState;
  }
}
