import 'package:covid19_app/core/blocs/authentication/authentication_bloc.dart';
import 'package:covid19_app/core/blocs/authentication/authentication_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../core/widgets/index.dart';
import '../../../data/models/country_statistics_model.dart';
import '../bloc/index.dart';

class CountryStaticticsProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 10.0,
      clipBehavior: Clip.hardEdge,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Container(
        height: this.getHeight(context, percent: .35),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        width: this.getWidth(context),
        child: BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
          CountryStatisticsModel statistics = state.selectedCountryStatistics;
          if (statistics == null) return Container();
          return Stack(
            children: <Widget>[
              ImageRotater(
                imagePath: "assets/images/progress.png",
                sizePercent: 1,
                color: Colors.black,
                opacity: 0.1,
                animationDuration: Duration(seconds: 10),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 30.0,
                  ),
                  Stack(
                    children: <Widget>[
                      Center(
                        child: Text(
                          statistics.countryName,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 25),
                        ),
                      ),
                      Positioned(
                        right: 0,
                        top:-5,
                        child: IconButton(
                          color: Colors.white,
                          icon: Icon(Icons.exit_to_app),
                          onPressed: () {
                            GetIt.instance
                                .get<AuthenticationBloc>()
                                .add(AuthenticationLogoutEvent());
                          },
                        ),
                      )
                    ],
                  ),
                  Divider(),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Wrap(
                        direction: Axis.horizontal,
                        runSpacing: 10.0,
                        spacing: 10.0,
                        alignment: WrapAlignment.center,
                        children: <Widget>[
                          InfoFocusedChip("Toplam Test", statistics.totalTests),
                          InfoFocusedChip("Toplam Vaka", statistics.cases),
                          InfoFocusedChip("Aktif Vaka", statistics.activeCases),
                          InfoFocusedChip(
                              "İyileşen", statistics.totalRecovered),
                          InfoFocusedChip("Ölüm", statistics.deaths),
                          InfoFocusedChip(
                              "Kritik Hasta", statistics.seriousCritical),
                          InfoFocusedChip(
                            "Yeni Vaka",
                            statistics.newCases,
                            color: Colors.red,
                          ),
                          InfoFocusedChip(
                            "Yeni Ölüm",
                            statistics.newDeaths,
                            color: Colors.red,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ],
          );
        }),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.purple[800],
              Colors.purple[200],
              Colors.purple[600]
            ],
          ),
        ),
      ),
    );
  }
}

/*         */
