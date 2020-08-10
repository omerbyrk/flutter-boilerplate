import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import '../../../core/blocs/bases/bloc_state_base.dart';
import '../../../core/consts/enums.dart';
import '../../../data/models/movie_model.dart';
import '../../../domain/entities/movie_entity.dart';

abstract class HomeState extends Equatable {
  final List<MovieEntity> movieList;
  final MovieEntity selectedMovie;
  const HomeState({this.movieList, this.selectedMovie});

  @override
  List<Object> get props => ([movieList, selectedMovie]);
}

class UnHome extends HomeState {
  const UnHome({movieList, selectedMovie})
      : super(movieList: movieList, selectedMovie: selectedMovie);
}

class HomeInProgress extends HomeState with BlocInProgressStateBase {
  HomeInProgress.fromOldState(HomeState oldState,
      {List<MovieModel> movieList, MovieModel selectedMovie})
      : super(
          movieList: movieList ?? oldState.movieList,
          selectedMovie: selectedMovie ?? oldState.selectedMovie,
        );
}

class HomeLoadded extends HomeState {
  HomeLoadded.fromOldState(HomeState oldState,
      {List<MovieModel> movieList, MovieModel selectedMovie})
      : super(
          movieList: movieList ?? oldState.movieList,
          selectedMovie: selectedMovie ?? oldState.selectedMovie,
        );
}

// ignore: must_be_immutable
class HomeOnMessage extends HomeState with BlocOnMessageStateBase {
  HomeOnMessage.fromOldState(HomeState oldState,
      {List<MovieModel> movieList,
      MovieModel selectedMovie,
      @required String message,
      type = MessageType.INFO})
      : super(
          movieList: movieList ?? oldState.movieList,
          selectedMovie: selectedMovie ?? oldState.selectedMovie,
        ) {
    this.message = message;
    this.type = type;
  }
}
