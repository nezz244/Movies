import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wookie_movies_flutter_lrliwe/services/movie_service.dart';
import 'package:wookie_movies_flutter_lrliwe/blocs/movie_event.dart';
import 'package:wookie_movies_flutter_lrliwe/blocs/movie_state.dart';
class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final MovieService movieService;
  MovieBloc(this.movieService) : super(MovieLoading()) {
    on<FetchMovies>((event, emit) async {
      try {
        emit(MovieLoading());
        final movies = await movieService.fetchMovies();
        emit(MovieLoaded(movies));
      } catch (e) {
        emit(MovieError());
        if (kDebugMode) {
          print('Error loading movies: $e');
        }
      }
    });

  }
}
