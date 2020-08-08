import 'package:flutter/foundation.dart';

import '../../consts/enums.dart';
import '../bases/bloc_state_base.dart';

abstract class BootStartState {}

/// UnInitialized
class UnBootstart extends BootStartState {}

class BootStartIsOver extends BootStartState {}

class BootstartStateOnMessage extends BootStartState
    with BlocOnMessageStateBase {
  BootstartStateOnMessage.fromOldSettingState(
      {@required String message, type = MessageType.INFO}) {
    this.message = message;
    this.type = type;
  }
}
