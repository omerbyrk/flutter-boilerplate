import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashState(message: "", twenEnd: 3.0));

  void setMessage(String message) =>
      emit(SplashState(message: message, twenEnd: this.state.twenEnd));
  void setTweenEnd(double tweenEnd) =>
      emit(SplashState(message: this.state.message, twenEnd: tweenEnd));
}
