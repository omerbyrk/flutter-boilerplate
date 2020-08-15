import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_it/get_it.dart';

import 'core/blocs/authentication/index.dart';
import 'core/blocs/bootstart/index.dart';
import 'core/localization/app_localizations.dart';
import 'core/theme/app_theme.dart';
import 'core/widgets/index.dart';
import 'dependency_injection.dart' as di;
import 'presentations/home/pages/home_page.dart';
import 'presentations/login/pages/login_page.dart';
import 'presentations/splash/pages/splash_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.configure(di.Env.dev);
  runApp(AppBootstart());
}

// This widget is the root of your application.
class AppBootstart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateTitle: (context) {
        // I know it is a wrong place but It would be woderful if Material app has an onStart event. You can create a custom Material App widget
        // Register all depenencies in there which depends on the context
        this.dInjectionUIThenBoostart(context);
        return t("app_title");
      },
      theme: themeData,
      supportedLocales: [
        Locale("en", "US"),
        Locale("tr", "US"),
        Locale("tr", "TR")
      ],
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      localeResolutionCallback: (locale, supportedLocales) {
        for (var supportedLocale in supportedLocales) {
          if (supportedLocale.languageCode == locale.languageCode &&
              supportedLocale.countryCode == locale.countryCode) {
            return supportedLocale;
          }
        }
        return supportedLocales.first;
      },
      home: BlocProvider(
        create: (_) => GetIt.instance.get<BootstartBloc>(),
        child: BlocBuilder<BootstartBloc, BootStartState>(
          builder: (context, state) {
            if (state is BootStartIsOver) {
              return app(context);
            } else if (state is BootstartStateOnMessage) {
              return SplashPage(state.message);
            } else
              return Container();
          },
        ),
      ),
    );
  }

  Widget app(BuildContext context) {
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

  void dInjectionUIThenBoostart(BuildContext context) {
    di.configureUI(context);
    // If not start the event, we start it.(this method can run twice)
    if (GetIt.instance.get<BootstartBloc>().state is UnBootstart)
      GetIt.instance.get<BootstartBloc>().add(LoadBootstartEvent());
  }
}
