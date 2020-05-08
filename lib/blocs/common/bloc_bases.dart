import 'package:covid19_app/blocs/common/bloc_state_bases.dart';

abstract class StateChangerBlocBase {
  void toOnMessageState(BlocOnMessageStateBase onMessageState);
  void toInProgressState();
  void toLoaddedState();
}
