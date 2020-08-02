import 'package:covid19_app/blocs/home/index.dart';
import 'package:covid19_app/components/BlocFlushbarShow.dart';
import 'package:covid19_app/components/BlocProgressIndicator.dart';
import 'package:covid19_app/pages/home/CountryStaticticsListScreen.dart';
import 'package:covid19_app/pages/home/CountryStaticticsProfileScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  HomeBloc _homeBloc = new HomeBloc();

  @override
  StatelessElement createElement() {
    _homeBloc.add(LoadCountryStatisticsList());
    return super.createElement();
  }

  @override
  Widget build(BuildContext context) {
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
