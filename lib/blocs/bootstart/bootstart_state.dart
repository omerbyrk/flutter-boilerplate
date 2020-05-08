import 'package:covid19_app/blocs/common/bloc_state_bases.dart';
import 'package:covid19_app/blocs/common/enums.dart';
import 'package:flutter/foundation.dart';

abstract class BootstartState {}

/// UnInitialized
class UnBootstartState extends BootstartState {}

class BootStartOverState extends BootstartState {}

class BootstartStateOnMessage extends BootstartState
    with BlocOnMessageStateBase {
  BootstartStateOnMessage.fromOldSettingState(
      {@required String message, type = MessageType.INFO}) {
    this.message = message;
    this.type = type;
  }
}
