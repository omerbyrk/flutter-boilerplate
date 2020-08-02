import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../core/blocs/authentication/authentication_bloc.dart';
import '../../../core/blocs/authentication/authentication_event.dart';
import '../../../core/widgets/app_fade_animation.dart';
import '../../../core/widgets/app_gradient_button.dart';
import '../../../core/widgets/app_textfield.dart';
import '../bloc/index.dart';
import '../bloc/login_state.dart';


class LoginPageForm extends StatefulWidget {
  @override
  _LoginPageFormState createState() => _LoginPageFormState();
}

class _LoginPageFormState extends State<LoginPageForm> {
  TextEditingController usernameTextController = TextEditingController();
  TextEditingController passwordTextController = TextEditingController();
  AuthenticationBloc _authenticationBloc =
      GetIt.instance.get<AuthenticationBloc>();
  LoginBloc _loginBloc;
  StreamSubscription<LoginState> loginBlocSubscription;

  @override
  void initState() {
    _loginBloc = BlocProvider.of<LoginBloc>(context);
    loginBlocSubscription = _loginBloc.listen((state) {
      if (state is InLoginState) {
        _authenticationBloc.add(LoadAuthenticationEvent(state.token));
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0),
      child: AppFadeAnimation(
        duration: Duration(milliseconds: 600),
        child: Column(
          children: <Widget>[
            AppTextField(
              hintText: "Username",
              controller: usernameTextController,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: const Radius.circular(16),
                      topRight: const Radius.circular(16)),
                  side: BorderSide(color: Colors.grey[200])),
            ),
            AppTextField(
              hintText: "Password",
              controller: passwordTextController,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      bottomLeft: const Radius.circular(16),
                      bottomRight: const Radius.circular(16)),
                  side: BorderSide(color: Colors.grey[200])),
            ),
            SizedBox(
              height: 15.0,
            ),
            AppFadeAnimation(
              duration: const Duration(milliseconds: 750),
              child: AppGradientButton(
                buttonText: "Tab to login",
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
