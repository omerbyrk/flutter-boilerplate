import 'package:flutter/foundation.dart';

import '../base/bloc_state_base.dart';
import '../utils/enums.dart';


abstract class Bootstart {}

/// UnInitialized
class UnBootstart extends Bootstart {}

class BootStartIsOver extends Bootstart {}

class BootstartStateOnMessage extends Bootstart
    with BlocOnMessageStateBase {
  BootstartStateOnMessage.fromOldSettingState(
      {@required String message, type = MessageType.INFO}) {
    this.message = message;
    this.type = type;
  }
}
