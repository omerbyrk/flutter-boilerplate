import '../../localization/app_localization_base.dart';

abstract class BlocEventBase<State, Bloc> extends AppLocalizationBase {
  final State toState;
  BlocEventBase({this.toState});
  Stream<State> applyAsync({State currentState, Bloc bloc}) async* {
    yield toState ?? currentState;
  }
}
