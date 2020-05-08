import 'package:covid19_app/blocs/authentication/index.dart';
import 'package:covid19_app/blocs/login/index.dart';
import 'package:covid19_app/components/AppFadeAnimation.dart';
import 'package:covid19_app/components/AppGradientButton.dart';
import 'package:covid19_app/components/AppLogoImage.dart';
import 'package:covid19_app/components/AppTextField.dart';
import 'package:covid19_app/components/BlocFlushbarShow.dart';
import 'package:covid19_app/components/BlocProgressIndicator.dart';
import 'package:covid19_app/pages/HookWidgetBase.dart';
import 'package:covid19_app/utils/clippers/WavyBottomCLipper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class LoginPage extends HookWidgetBase {
  @override
  Widget build(BuildContext context) {
    AuthenticationBloc _authenticationBloc =
        BlocProvider.of<AuthenticationBloc>(context);
    LoginBloc _loginBloc = LoginBloc();

    final usernameTextController = useTextEditingController();
    final passwordTextController = useTextEditingController();

    useEffect(() {
      var loginStateSubscription = _loginBloc.listen((state) {
        if (state is LoginStateLoadded) {
          _authenticationBloc.add(LoadAuthenticationEvent(state.token));
        }
      });
      return () async {
        loginStateSubscription.cancel();
      };
    }, []);

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
                      height: this.getHeight(percent: .45),
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
                          duration: Duration(milliseconds: 1000),
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
                    duration: const Duration(milliseconds: 1500),
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
                      duration: Duration(milliseconds: 2000),
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
                            duration: const Duration(milliseconds: 2500),
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
