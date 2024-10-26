import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wookie_movies_flutter_lrliwe/blocs/movie_bloc.dart';
import 'package:wookie_movies_flutter_lrliwe/blocs/movie_state.dart';
import 'package:wookie_movies_flutter_lrliwe/models/movie.dart';
import 'package:wookie_movies_flutter_lrliwe/themes/colors.dart';
import '../themes/icons.dart';

class MovieSearch extends StatelessWidget {
  final TextEditingController searchController;
  final Function(List<Movie>) onMoviesFiltered;

  const MovieSearch({
    super.key,
    required this.searchController,
    required this.onMoviesFiltered,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: searchController,
        decoration: InputDecoration(
          hintText: 'Search Movies',
          filled: true,
          fillColor: AppColors.lightGrey.withOpacity(0.5),
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          prefixIcon: Padding(
            padding: const EdgeInsets.all(12.0),
            child: AppIcons.searchIcon(),
          ),
        ),
        onChanged: (query) {
          final movies = (BlocProvider.of<MovieBloc>(context).state as MovieLoaded).movies;
          final filteredMovies = movies.where((movie) =>
              movie.title.toLowerCase().contains(query.toLowerCase())
          ).toList();
          onMoviesFiltered(filteredMovies);
        },
      ),
    );
  }
}
