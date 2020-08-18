import '../../localization/app_localization_base.dart';

/// [BlocEventBase] is base class for all BlocEvents.
/// Its basic functions are [applyAsync] method, and localizations.
/// It extends [AppLocalizationBase] to get localization features.
abstract class BlocEventBase<State, Bloc> extends AppLocalizationBase {
  final State toState;
  BlocEventBase({this.toState});

  /// [applyAsync] is a common function across all event classes.
  /// If not override the [applyAsync] method, it yield [toState] or [currentState]
  Stream<State> applyAsync({State currentState, Bloc bloc}) async* {
    yield toState ?? currentState;
  }
}
