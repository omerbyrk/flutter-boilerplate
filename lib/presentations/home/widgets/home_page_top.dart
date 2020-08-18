import 'package:flutmovie/core/blocs/authentication/authentication_bloc.dart';
import 'package:flutmovie/core/blocs/authentication/index.dart';
import 'package:flutmovie/core/consts/enums.dart';
import 'package:flutmovie/core/theme/app_colors.dart';
import 'package:flutmovie/core/utils/validations.dart';
import 'package:flutmovie/core/widgets/index.dart';
import 'package:flutmovie/presentations/home/bloc/home_bloc.dart';
import 'package:flutmovie/presentations/home/bloc/home_event.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class HomePageTop extends StatelessWidget {
  final TextEditingController txtSearchMovieController =
      new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 10.0,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [AppColors.red[800], AppColors.red[400]],
          ),
        ),
        padding: EdgeInsets.symmetric(
            horizontal: this.convertSize(10), vertical: this.convertSize(40)),
        child: Column(
          children: [
            buildTopIcons(),
            buildLogoImage(context),
            buildSearchTextField()
          ],
        ),
      ),
    );
  }

  AppTextField buildSearchTextField() {
    return AppTextField(
      icon: Icons.search,
      hintText: t("home_search_movie_hint"),
      controller: txtSearchMovieController,
      onIconClick: () {
        String input = txtSearchMovieController.text;
        if (Validations.sNotNullOrEmpty(input)) {
          GetIt.instance
              .get<HomeBloc>()
              .add(SearchMovieByTitleEvent(title: input));
        } else {
          GetIt.instance.get<HomeBloc>().add(LoadLocalMovieListEvent());
        }
      },
    );
  }

  Image buildLogoImage(BuildContext context) {
    return Image.asset(
      "assets/images/logo.png",
      height: this.getHeight(context, percent: .17),
      width: this.getWidth(context, percent: .30),
      fit: BoxFit.fitWidth,
      color: Colors.white,
    );
  }

  Container buildTopIcons() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            Icons.menu,
            color: AppColors.sky[300],
            size: getIconSize(SizeType.xxLarge),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.notifications,
                color: AppColors.sky[300],
                size: getIconSize(SizeType.Middle),
              ),
              SizedBox(
                width: convertSize(20),
              ),
              PopupMenuButton(
                  onSelected: (selected) {
                    if (selected == t("profile")) {
                      debugPrint("ProfileClicked");
                    } else if (selected == t("logout")) {
                      GetIt.instance
                          .get<AuthenticationBloc>()
                          .add(AuthenticationLogoutEvent());
                    }
                  },
                  child: Icon(
                    Icons.person,
                    color: AppColors.sky[300],
                    size: getIconSize(SizeType.Large),
                  ),
                  itemBuilder: (_) {
                    return [
                      PopupMenuItem(
                        value: t("profile"),
                        child: Text(t("profile")),
                      ),
                      PopupMenuItem(
                        value: t("logout"),
                        child: Text(t("logout")),
                      )
                    ];
                  }),
            ],
          ),
        ],
      ),
    );
  }
}
