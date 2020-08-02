import '../utils/enums.dart';

abstract class BlocOnMessageStateBase {
  String message;
  MessageType type;
}

abstract class BlocInProgressStateBase {}
