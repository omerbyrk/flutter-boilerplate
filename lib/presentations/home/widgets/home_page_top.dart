import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../core/blocs/authentication/authentication_bloc.dart';
import '../../../core/blocs/authentication/index.dart';
import '../../../core/consts/enums.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/utils/validations.dart';
import '../../../core/widgets/index.dart';
import '../bloc/home_bloc.dart';
import '../bloc/home_event.dart';

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
        padding: EdgeInsets.only(
            left: this.convertSize(10),
            right: convertSize(10),
            top: convertSize(5),
            bottom: this.convertSize(20)),
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
      height: this.getHeight(context, percent: .16),
      width: this.getWidth(context, percent: .30),
      fit: BoxFit.fitWidth,
      color: AppColors.white,
    );
  }

  SafeArea buildTopIcons() {
    return SafeArea(
      bottom: false,
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
