abstract class BlocEventBase<State, Bloc> {
  final State toState;
  BlocEventBase({this.toState});
  Stream<State> applyAsync({State currentState, Bloc bloc}) async* {
    yield toState ?? currentState;
  }
}
