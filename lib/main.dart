import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import 'core/blocs/authentication/index.dart';
import 'core/blocs/bootstart/index.dart';
import 'dependency_injection.dart' as di;
import 'presentations/home/pages/home_page.dart';
import 'presentations/login/pages/login_page.dart';
import 'presentations/splash/pages/SplashPage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(AppBootstart());
}

class AppBootstart extends StatelessWidget {
  // This widget is the root of your application.
  @override
  StatelessElement createElement() {
    GetIt.instance.get<BootstartBloc>()
        .add(LoadBootstartEvent());
    return super.createElement();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Movie BooilerPlate',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: BlocProvider(
        create: (_) => GetIt.instance.get<BootstartBloc>(),
        child: BlocBuilder<BootstartBloc, BootStartState>(
          builder: (_, state) {
            if (state is BootStartIsOver) {
              return app();
            } else if (state is BootstartStateOnMessage) {
              return SplashPage(state.message);
            } else
              return Container();
          },
        ),
      ),
    );
  }

  Widget app() {
    return BlocProvider(
      create: (_) => GetIt.instance.get<AuthenticationBloc>(),
      child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (_, state) {
          if (state is UnAuthentication) {
            return LoginPage();
          } else if (state is InAuthentication) {
            return HomePage();
          } else if (state is AuthenticationStateOnMessage) {
            return SplashPage(state.message);
          } else
            return Container();
        },
      ),
    );
  }
}
