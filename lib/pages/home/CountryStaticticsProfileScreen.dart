import 'package:covid19_app/blocs/home/home_bloc.dart';
import 'package:covid19_app/blocs/home/home_state.dart';
import 'package:covid19_app/components/InfoFocusedChip.dart';
import 'package:covid19_app/components/PositionedVirusImageRotater.dart';
import 'package:covid19_app/model/CountryStatistics.dart';
import 'package:covid19_app/pages/HookWidgetBase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class CountryStaticticsProfileScreen extends HookWidgetBase {
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
        height: this.getHeight(percent: .35),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        width: this.getWidth(),
        child: BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
          CountryStatistics statistics = state.selectedCountryStatistics;
          if (statistics == null) return Container();
          return Stack(
            children: <Widget>[
              HookBuilder(builder: (context) {
                return PositionedVirusImageRotater(
                  height: this.getHeight(percent: .5),
                  width: this.getWidth(percent: .5),
                );
              }),
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
