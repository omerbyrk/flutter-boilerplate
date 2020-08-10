import 'dart:async';

import '../../../core/blocs/bases/bloc_event_base.dart';
import '../../../data/models/movie_model.dart';
import '../../../domain/entities/movie_entity.dart';
import '../../../domain/usecases/usecase.dart';
import 'index.dart';

class HomeEvent extends BlocEventBase<HomeState, HomeBloc> {
  HomeEvent({HomeState toState}) : super(toState: toState);
}

class LoadLocalMovieList extends HomeEvent {
  @override
  Stream<HomeState> applyAsync({HomeState currentState, HomeBloc bloc}) async* {
    yield HomeInProgress.fromOldState(currentState);
    List<MovieEntity> movieList =
        bloc.extractEither(await bloc.getLocalMovieList(NoParams()));
    //bloc.extractEither(await bloc.clearLocalMovieList(NoParams()));
    yield HomeLoadded.fromOldState(currentState, movieList: movieList);
  }
}

class SearchMovie extends HomeEvent {
  final MovieModel countryStatistics;
  SearchMovie(this.countryStatistics);

  @override
  Stream<HomeState> applyAsync(
      {HomeState currentState, HomeBloc bloc}) async* {}
}
