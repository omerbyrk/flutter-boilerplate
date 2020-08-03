import 'package:covid19_app/core/widgets/index.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/blocs/widgets/bloc_flushbar_show.dart';
import '../../../core/blocs/widgets/bloc_progress_indicator.dart';
import '../bloc/index.dart';
import '../widgets/index.dart';

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
