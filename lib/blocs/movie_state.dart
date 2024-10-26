import 'package:wookie_movies_flutter_lrliwe/models/movie.dart';

abstract class MovieState {}

class MovieLoading extends MovieState {}

class MovieLoaded extends MovieState {
  final List<Movie> movies;
  MovieLoaded(this.movies);
}

class MovieError extends MovieState {}
