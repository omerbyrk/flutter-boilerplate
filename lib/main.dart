import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/bloc/authentication/index.dart';
import 'core/bloc/base/bloc_state_base.dart';
import 'core/bloc/bootstart/index.dart';
import 'features/home/presentation/pages/home_page.dart';
import 'features/login/presentation/pages/login_page.dart';
import 'features/splash/presentation/pages/SplashPage.dart';

void main() => runApp(MaterialApp(
    title: 'Movie BooilerPlate',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primarySwatch: Colors.purple,
    ),
    home: AppBootstart()));

class AppBootstart extends StatelessWidget {
  // This widget is the root of your application.
  final BootstartBloc _bootstartBloc = new BootstartBloc();
  final AuthenticationBloc _authenticationBloc = AuthenticationBloc();

  @override
  StatelessElement createElement() {
    // TODO: implement createElement
    _bootstartBloc
        .add(LoadBootstartEvent(authenticationBloc: _authenticationBloc));
    return super.createElement();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => _bootstartBloc,
        child: BlocBuilder(
            cubit: _bootstartBloc,
            builder: (_, state) {
              if (state is BootStartIsOver) {
                return startApp();
              } else if (state is BootstartStateOnMessage) {
                return SplashPage(state.message);
              } else
                return Container();
            }));
  }

  Widget startApp() {
    return BlocProvider(
      create: (_) => _authenticationBloc,
      child: BlocBuilder(
        cubit: _authenticationBloc,
        builder: (_, state) {
          if (state is UnAuthentication) {
            return LoginPage();
          } else if (state is InAuthentication) {
            return HomePage();
          } else if (state is BlocOnMessageStateBase) {
            return SplashPage(state.message);
          } else
            return Container();
        },
      ),
    );
  }
}
