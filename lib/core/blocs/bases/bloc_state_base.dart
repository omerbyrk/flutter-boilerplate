import '../../../presentations/home/bloc/home_state.dart';
import '../../../presentations/login/bloc/index.dart';
import '../../consts/enums.dart';
import '../../widgets/index.dart';
import '../authentication/index.dart';

/// [BlocOnMessageStateBase] is used for showing message to user from the Block via [AppBlocFlushbarShow].
/// When a bloc fire a [BlocOnMessageStateBase] state, user will see the [message] on the screen
/// You can detemine message type with the [MessageType] enum.
/// Example: [LoginOnMessageState], [AuthenticationOnMessageState]
abstract class BlocOnMessageStateBase {
  /// The message which is seen on the screen
  String message;

  /// Message type
  MessageType type;
}

/// [BlocInProgressStateBase] is used for showing message to user from the Block via [AppBlocProgressIndicator].
/// When a bloc fire a [BlocInProgressStateBase] state, user will see the [AppCircularProgressIndicator] on the screen
/// Example: [LoginOnProgressState], [HomeInProgressState]
abstract class BlocInProgressStateBase {}
