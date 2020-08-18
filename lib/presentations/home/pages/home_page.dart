import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../core/widgets/bloc_flushbar_show.dart';
import '../../../core/widgets/bloc_progress_indicator.dart';
import '../bloc/index.dart';
import '../widgets/home_page_bottom.dart';
import '../widgets/home_page_top.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  @override
  StatelessElement createElement() {
    GetIt.instance.get<HomeBloc>().add(LoadLocalMovieListEvent());
    return super.createElement();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocProvider<HomeBloc>(
        create: (_) => GetIt.instance.get<HomeBloc>(),
        child: Stack(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                HomePageTop(),
                Expanded(child: HomePageBottom())
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
