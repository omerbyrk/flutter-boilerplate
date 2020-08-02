import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/extensions/widget_extension.dart';
import '../../../../core/widgets/image_rotater.dart';
import '../../../../core/widgets/info_focused_chip.dart';
import '../../../../model/country_statistics.dart';
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
          CountryStatistics statistics = state.selectedCountryStatistics;
          if (statistics == null) return Container();
          return Stack(
            children: <Widget>[
              ImageRotater(
                imagePath: "assets/images/progress.png",
                height: this.getHeight(context, percent: .5),
                color:  Colors.black,
                opacity: 0.1,
                animationDuration: Duration(seconds: 10),
                width: this.getWidth(context, percent: .5),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 30.0,
                  ),
                  Center(
                    child: Text(
                      statistics.countryName,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 25),
                    ),
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
