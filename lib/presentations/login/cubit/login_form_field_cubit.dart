import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'login_form_field_state.dart';

class LoginFormFieldCubit extends Cubit<LoginFormFieldState> {
  LoginFormFieldCubit() : super(LoginFormFieldState());

  toggleShowPassword() =>
      emit(LoginFormFieldState(showPassword: !this.state.showPassword));
}
