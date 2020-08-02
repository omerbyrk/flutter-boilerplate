part of 'splash_cubit.dart';

class SplashState extends Equatable {
  final String message;
  final double twenEnd;

  const SplashState({this.message, this.twenEnd});

  @override
  // TODO: implement props
  List<Object> get props => [message, twenEnd];
}
