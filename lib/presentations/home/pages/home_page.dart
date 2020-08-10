import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../core/blocs/authentication/index.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/bloc_flushbar_show.dart';
import '../../../core/widgets/bloc_progress_indicator.dart';
import '../../../core/widgets/index.dart';
import '../../../domain/entities/movie_entity.dart';
import '../bloc/index.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  HomeBloc _homeBloc = GetIt.instance.get<HomeBloc>();

  @override
  StatelessElement createElement() {
    _homeBloc.add(LoadLocalMovieList());
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
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  alignment: Alignment.topRight,
                  child: RaisedButton.icon(
                    color: AppColors.navyBlue,
                    textColor: AppColors.sky,
                    label: Text(t("logout")),
                    icon: Icon(Icons.exit_to_app),
                    onPressed: () {
                      GetIt.instance
                          .get<AuthenticationBloc>()
                          .add(AuthenticationLogoutEvent());
                    },
                  ),
                ),
                BlocBuilder(
                    cubit: _homeBloc,
                    builder: (_, state) {
                      if ((state as HomeState).movieList != null) {
                        List<MovieEntity> movieList = state.movieList;

                        return Column(
                          children:
                              movieList.map((e) => Text(e.title)).toList(),
                        );
                      }

                      return Container();
                    })
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
