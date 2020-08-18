import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/index.dart';
import '../bloc/index.dart';
import '../widgets/index.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  HomeBloc _homeBloc = GetIt.instance.get<HomeBloc>();

  @override
  StatelessElement createElement() {
    _homeBloc.add(LoadLocalMovieListEvent());
    return super.createElement();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: BlocProvider<HomeBloc>(
        create: (_) => _homeBloc,
        child: Stack(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[HomePageTop(), HomePageBottom()],
            ),
            blocMessageBuilder(context, _homeBloc),
            blocProgressBuilder(context, _homeBloc)
          ],
        ),
      ),
    );
  }
}
