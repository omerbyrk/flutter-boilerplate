import 'dart:convert';

import 'package:injectable/injectable.dart';

import '../../exceptions/remote_server_exception.dart';
import '../../models/movie_model.dart';
import '../api_datasource_base.dart';

abstract class IMovieDataSource {
  Future<MovieModel> getByTitle(String title);
  Future<MovieModel> getByImdbID(String imdbID);
}

@lazySingleton
class MovieOmdbDataSource extends IMovieDataSource with ApiDataSourceBase {
  Future<MovieModel> getByTitle(String title) async {
    try {
      var response = await dio.get(endPoints.omdbGetByTitle(title));
      var movieMap = response.data;
      return MovieModel.fromMap(movieMap);
    } catch (err) {
      throw RemoteServerException(err);
    }
  }

  Future<MovieModel> getByImdbID(String imdbID) async {
    try {
      var response = await dio.get(endPoints.omdbGetByTitle(imdbID));
      var movieMap = jsonDecode(response.data);
      return MovieModel.fromMap(movieMap);
    } catch (err) {
      throw RemoteServerException(err);
    }
  }
}

/*List listProp = List.of(dataMap["countries_stat"]);
      List<MovieModel> countryStatisticsList = List.of(listProp
          .map((countryStatistics) => MovieModel.fromJson(countryStatistics))
          .cast<MovieModel>()
          .toList());*/
