import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'login_form_field_state.dart';

@injectable
class LoginFormFieldCubit extends Cubit<LoginFormFieldState> {
  LoginFormFieldCubit() : super(LoginFormFieldState());

  toggleShowPassword() =>
      emit(LoginFormFieldState(showPassword: !this.state.showPassword));
}
