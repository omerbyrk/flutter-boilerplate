import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:covid19_app/domain/usecases/movie/clear_local_movie_list.dart';
import 'package:covid19_app/domain/usecases/movie/get_local_movie_list.dart';
import 'package:flutter/foundation.dart';

import '../../../core/blocs/bases/bloc_base.dart';
import '../../../core/consts/enums.dart';
import '../../../domain/entities/movie_entity.dart';
import 'index.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> with AppBlocBase {
  final GetLocalMovieList getLocalMovieList;

  HomeBloc({@required this.getLocalMovieList})
      : super(UnHome(movieList: <MovieEntity>[], selectedMovie: null));

  @override
  Stream<HomeState> mapEventToState(
    HomeEvent event,
  ) async* {
    yield* event.applyAsync(currentState: state, bloc: this);
  }

  @override
  void toOnMessageState(String message, MessageType type) {
    this.add(HomeEvent(
        toState:
            HomeOnMessage.fromOldState(state, type: type, message: message)));
  }
}
