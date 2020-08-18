import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../core/blocs/authentication/authentication_bloc.dart';
import '../../../core/blocs/authentication/authentication_event.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/app_fade_animation.dart';
import '../../../core/widgets/app_gradient_button.dart';
import '../../../core/widgets/app_textfield.dart';
import '../../../core/widgets/index.dart';
import '../bloc/index.dart';
import '../bloc/login_state.dart';
import '../cubit/login_form_field_cubit.dart';

class LoginPageForm extends StatefulWidget {
  @override
  _LoginPageFormState createState() => _LoginPageFormState();
}

class _LoginPageFormState extends State<LoginPageForm> {
  TextEditingController usernameTextController = TextEditingController();
  TextEditingController passwordTextController = TextEditingController();
  AuthenticationBloc _authenticationBloc =
      GetIt.instance.get<AuthenticationBloc>();
  LoginFormFieldCubit _loginFormFieldCubit = LoginFormFieldCubit();
  LoginBloc _loginBloc;
  StreamSubscription<LoginState> loginBlocSubscription;

  @override
  void initState() {
    _loginBloc = BlocProvider.of<LoginBloc>(context);
    loginBlocSubscription = _loginBloc.listen((state) {
      if (state is InLoginStateState) {
        _authenticationBloc.add(LoadAuthenticationEvent());
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0),
      child: AppFadeAnimation(
        duration: Duration(milliseconds: 1000),
        child: Column(
          children: <Widget>[
            AppTextField(
              hintText: widget.t("lp_username_hint"),
              controller: usernameTextController,
              icon: Icons.person,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(this.widget.convertSize(20)),
                      topRight: Radius.circular(this.widget.convertSize(20))),
                  side: BorderSide(color: AppColors.grey[200])),
            ),
            BlocBuilder(
                cubit: this._loginFormFieldCubit,
                builder: (context, state) {
                  return AppTextField(
                    hintText: widget.t("lp_password_hint"),
                    controller: passwordTextController,
                    obscureText: !state.showPassword,
                    icon: Icons.remove_red_eye,
                    onIconClick: () {
                      _loginFormFieldCubit.toggleShowPassword();
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            bottomLeft:
                                Radius.circular(this.widget.convertSize(20)),
                            bottomRight:
                                Radius.circular(this.widget.convertSize(20))),
                        side: BorderSide(color: AppColors.grey[200])),
                  );
                }),
            SizedBox(
              height: widget.convertSize(20.0),
            ),
            AppFadeAnimation(
              duration: const Duration(milliseconds: 1400),
              child: AppGradientButton(
                buttonText: widget.t("lp_login_button"),
                onTap: () {
                  _loginBloc.add(LoadLoginEvent(usernameTextController.text,
                      passwordTextController.text));
                },
              ),
            ),
            SizedBox(
              height: 100,
            )
          ],
        ),
      ),
    );
  }
}
