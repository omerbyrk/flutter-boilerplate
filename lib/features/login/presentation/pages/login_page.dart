import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/bloc/authentication/index.dart';
import '../../../../core/clippers/wavy_bottom_clipper.dart';
import '../../../../core/extensions/widget_extension.dart';
import '../../../../core/widgets/app_fade_animation.dart';
import '../../../../core/widgets/app_gradient_button.dart';
import '../../../../core/widgets/app_logo_image.dart';
import '../../../../core/widgets/app_textfield.dart';
import '../../../../core/widgets/bloc_flushbar_show.dart';
import '../../../../core/widgets/bloc_progress_indicator.dart';
import '../bloc/index.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController usernameTextController = TextEditingController();
  TextEditingController passwordTextController = TextEditingController();
  AuthenticationBloc _authenticationBloc;
  LoginBloc _loginBloc;
  StreamSubscription<LoginState> loginBlocSubscription;

  @override
  void initState() {
    _authenticationBloc = BlocProvider.of<AuthenticationBloc>(context);
    _loginBloc = LoginBloc();

    loginBlocSubscription = _loginBloc.listen((state) {
      if (state is InLoginState) {
        _authenticationBloc.add(LoadAuthenticationEvent(state.token));
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    loginBlocSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (_) => _loginBloc,
        child: Stack(
          children: <Widget>[
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  ClipPath(
                    clipper: WavyBottomCLipper(),
                    child: Container(
                      height: this.widget.getHeight(context, percent: .45),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.centerRight,
                          colors: <Color>[
                            Colors.purple[800],
                            Colors.purple[300],
                            Colors.purple[600]
                          ],
                        ),
                      ),
                      child: Center(
                        child: AppFadeAnimation(
                          duration: Duration(milliseconds: 300),
                          child: AppLogoImage(
                            width: 250,
                            height: 250,
                            inAnimated: false,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  AppFadeAnimation(
                    duration: const Duration(milliseconds: 450),
                    child: Center(
                        child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Icon(
                          Icons.lock,
                          size: 30,
                          color: Colors.black87,
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        Text(
                          "Login Form",
                          style: TextStyle(
                              color: Colors.black87,
                              fontSize: 35,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    )),
                  ),
                  Divider(),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
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
                                _loginBloc.add(LoadLoginEvent(
                                    usernameTextController.text,
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
                  ),
                ],
              ),
            ),
            BlocProgressIndicator<LoginBloc>(),
            BlocFlushbarShow<LoginBloc>()
          ],
        ),
      ),
    );
  }
}
