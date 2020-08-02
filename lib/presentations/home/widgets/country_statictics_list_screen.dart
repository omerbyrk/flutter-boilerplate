import 'package:covid19_app/data/models/country_statistics_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/index.dart';

class CountryStaticticsListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _homeBloc = BlocProvider.of<HomeBloc>(context);
    return BlocBuilder<HomeBloc, HomeState>(cubit: _homeBloc, builder: (_, state) {
      var countryStatisticsList = state.countryStatisticsList
          .where((statictics) => statictics.countryName.isNotEmpty)
          .toList();
      return Expanded(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Icon(
                  Icons.warning,
                  size: 25.0,
                ),
                SizedBox(
                  width: 5.0,
                ),
                Text(
                  "Ülkeler(${countryStatisticsList.length})",
                  style: TextStyle(
                      color: Colors.black87,
                      fontSize: 18,
                      fontWeight: FontWeight.w700),
                )
              ],
            ),
            Divider(),
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.only(top: 5.0),
                separatorBuilder: (_, i) => Divider(),
                itemCount: countryStatisticsList.length,
                itemBuilder: (_, i) {
                  CountryStatisticsModel statistics = countryStatisticsList[i];
                  return ListTile(
                    onTap: () {
                      _homeBloc.add(SelectCountryStatistics(statistics));
                    },
                    title: Text(
                      statistics.countryName,
                      style: TextStyle(
                          color: Colors.black87,
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    ),
                    dense: true,
                    trailing: Chip(
                      backgroundColor: Colors.red.withOpacity(.25),
                      label: Text(
                        statistics.cases,
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      );
    });
  }
}
