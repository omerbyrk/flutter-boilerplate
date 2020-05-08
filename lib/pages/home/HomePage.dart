import 'package:covid19_app/blocs/home/index.dart';
import 'package:covid19_app/components/BlocFlushbarShow.dart';
import 'package:covid19_app/components/BlocProgressIndicator.dart';
import 'package:covid19_app/pages/HookWidgetBase.dart';
import 'package:covid19_app/pages/home/CountryStaticticsListScreen.dart';
import 'package:covid19_app/pages/home/CountryStaticticsProfileScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class HomePage extends HookWidgetBase {
  HomeBloc _homeBloc = new HomeBloc();

  @override
  Widget build(BuildContext context) {
    useEffect(() {
      _homeBloc.add(LoadCountryStatisticsList());
      return null;
    }, []);

    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocProvider<HomeBloc>(
        create: (_) => _homeBloc,
        child: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                CountryStaticticsProfileScreen(),
                CountryStaticticsListScreen(),
              ],
            ),
            BlocProgressIndicator<HomeBloc>(),
            BlocFlushbarShow<HomeBloc>()
          ],
        ),
      ),
    );
  }
}
