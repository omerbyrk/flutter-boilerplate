import 'package:flutter/material.dart';

import '../../domain/entities/movie_entity.dart';
import '../consts/enums.dart';
import '../theme/app_colors.dart';
import 'app_google_translated_text.dart';
import 'app_image_hero.dart';
import 'index.dart';

class AppMovieDetails extends StatelessWidget {
  final MovieEntity movieEntity;

  const AppMovieDetails({Key key, this.movieEntity}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Material(
                elevation: 5.0,
                child: Container(
                  width: getWidth(context, percent: 1),
                  height: getHeight(context, percent: .6),
                  child: AppImageHero(
                    path: movieEntity.poster,
                  ),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        vertical: convertSize(30), horizontal: convertSize(20)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        movieInfoCard(context, Icons.subject, movieEntity.plot),
                        sizedbox(),
                        movieInfoCard(
                            context, Icons.category, movieEntity.genre),
                        sizedbox(),
                        movieInfoCard(
                            context, Icons.timer, movieEntity.runtime),
                        sizedbox(),
                        movieInfoCard(
                            context, Icons.language, movieEntity.language),
                        sizedbox(),
                        movieInfoCard(context, Icons.calendar_today,
                            movieEntity.released),
                        sizedbox(),
                        movieInfoCard(
                            context, Icons.video_call, movieEntity.director),
                        sizedbox(),
                        movieInfoCard(context, Icons.edit, movieEntity.writer),
                        sizedbox(),
                        movieInfoCard(context, Icons.star, movieEntity.actors),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
          closeButton(context)
        ],
      ),
    );
  }

  Widget movieInfoCard(BuildContext context, IconData data, String content) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: getWidth(context, percent: .1),
          child: Align(
            alignment: Alignment.topLeft,
            child: Icon(
              data,
              size: getFontSize(SizeType.Large),
              color: AppColors.navyBlue,
            ),
          ),
        ),
        Expanded(
          child: AppGTText(
            text: content,
            align: TextAlign.justify,
            color: AppColors.black,
            sizeType: SizeType.Small,
          ),
        )
      ],
    );
  }

  Widget sizedbox() {
    return SizedBox(
      height: convertSize(30),
    );
  }

  Widget closeButton(BuildContext context) {
    return Positioned(
      right: convertSize(25),
      top: convertSize(25),
      child: InkWell(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: Container(
          decoration: BoxDecoration(
              color: AppColors.black.withOpacity(.5),
              borderRadius: BorderRadius.circular(convertSize(8))),
          child: Icon(
            Icons.close,
            color: AppColors.white,
            size: getIconSize(SizeType.Mega),
          ),
        ),
      ),
    );
  }
}
