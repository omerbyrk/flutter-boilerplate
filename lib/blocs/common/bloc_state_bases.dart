import 'package:covid19_app/blocs/common/enums.dart';

abstract class BlocOnMessageStateBase {
  String message;
  MessageType type;
}

abstract class BlocInProgressStateBase {}
