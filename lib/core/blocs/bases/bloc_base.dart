import 'bloc_state_base.dart';

abstract class StateChangerBlocBase {
  void toOnMessageState(BlocOnMessageStateBase onMessageState);
  void toInProgressState();
  void toLoaddedState();
}
