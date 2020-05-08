import 'package:covid19_app/blocs/authentication/index.dart';
import 'package:covid19_app/blocs/bootstart/bootstart_bloc.dart';
import 'package:covid19_app/blocs/bootstart/index.dart';
import 'package:covid19_app/blocs/common/bloc_state_bases.dart';
import 'package:covid19_app/pages/HookWidgetBase.dart';
import 'package:covid19_app/pages/home/HomePage.dart';
import 'package:covid19_app/pages/login/LoginPage.dart';
import 'package:covid19_app/pages/splash/SplashPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

void main() => runApp(MaterialApp(
    title: 'Flutter Boilerplate',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primarySwatch: Colors.purple,
    ),
    home: AppBootstart()));

class AppBootstart extends HookWidgetBase {
  // This widget is the root of your application.
  final BootstartBloc _bootstartBloc = new BootstartBloc();
  final AuthenticationBloc _authenticationBloc = AuthenticationBloc();

  @override
  Widget build(BuildContext context) {
    useEffect(() {
      _bootstartBloc
          .add(LoadBootstartEvent(authenticationBloc: _authenticationBloc));
      return () async {
        await _bootstartBloc.close();
        await _authenticationBloc.close();
      };
    }, []);

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => _bootstartBloc,
        ),
        BlocProvider(
          create: (_) => _authenticationBloc,
        ),
      ],
      child: BlocBuilder(
          bloc: _bootstartBloc,
          builder: (_, state) {
            if (state is BootStartOverState) {
              return startApplication();
            } else if (state is BlocOnMessageStateBase) {
              return SplashPage(state.message);
            } else
              return Container();
          }),
    );
  }

  Widget startApplication() {
    return BlocBuilder(
      bloc: _authenticationBloc,
      builder: (_, state) {
        print("State");
        print(state);
        if (state is UnAuthenticationState) {
          return LoginPage();
        } else if (state is InAuthenticationState) {
          return HomePage();
        } else if (state is BlocOnMessageStateBase) {
          return SplashPage(state.message);
        } else
          return Container();
      },
    );
  }
}
