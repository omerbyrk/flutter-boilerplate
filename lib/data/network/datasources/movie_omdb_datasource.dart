import 'package:injectable/injectable.dart';

import '../../../core/localization/app_localization_base.dart';
import '../../../core/utils/validations.dart';
import '../../exceptions/remote_server_exception.dart';
import '../../models/movie_model.dart';
import '../api_datasource_base.dart';

abstract class IMovieDataSource extends AppLocalizationBase {
  Future<MovieModel> getByTitle(String title);
  Future<MovieModel> getByImdbID(String imdbID);
  Future<List<MovieModel>> searchByTitle(String title);
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
      var response = await dio.get(endPoints.omdbGetByImdbID(imdbID));
      var movieMap = response.data;
      return MovieModel.fromMap(movieMap);
    } catch (err) {
      throw RemoteServerException(err);
    }
  }

  @override
  Future<List<MovieModel>> searchByTitle(String title) async {
    try {
      var response = await dio.get(endPoints.omdbSearchTitle(title));
      List<dynamic> movieMapList = response.data["Search"];

      if (!Validations.lNotNullOrEmpty(movieMapList)) {
        throw new Exception(t("movie_not_fount", params: [title]));
      }

      List<MovieModel> movieList = new List<MovieModel>();

      for (var i = 0; i < movieMapList.length; i++) {
        String imdbID = movieMapList[i]["imdbID"];
        MovieModel movieModel = await getByImdbID(imdbID);
        if (movieModel != null) movieList.add(movieModel);
      }

      return movieList;
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
