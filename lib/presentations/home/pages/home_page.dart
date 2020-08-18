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
  @override
  StatelessElement createElement() {
    GetIt.instance.get<HomeBloc>().add(LoadLocalMovieListEvent());
    return super.createElement();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: BlocProvider<HomeBloc>(
        create: (_) => GetIt.instance.get<HomeBloc>(),
        child: Stack(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[HomePageTop(), HomePageBottom()],
            ),
            AppBlocProgressIndicator<HomeBloc>(),
            AppBlocFlushbarShow<HomeBloc>()
          ],
        ),
      ),
    );
  }
}
