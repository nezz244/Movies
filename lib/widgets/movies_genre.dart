import 'package:flutter/material.dart';
import 'package:wookie_movies_flutter_lrliwe/models/movie.dart';
import 'package:wookie_movies_flutter_lrliwe/themes/colors.dart';
import 'package:wookie_movies_flutter_lrliwe/themes/fonts.dart';
import 'package:wookie_movies_flutter_lrliwe/widgets/movie_widget.dart';

class MoviesGenre extends StatelessWidget {
  final String genre;
  final List<Movie> movies;
  final bool showDivider;
  final Function(Movie) onMovieSelected;

  const MoviesGenre({
    super.key,
    required this.genre,
    required this.movies,
    required this.showDivider,
    required this.onMovieSelected,
  });

  @override
  Widget build(BuildContext context) {
    final genreMovies = movies.where((m) => m.genres.contains(genre)).toList();

    if (genreMovies.isNotEmpty) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (showDivider)
            Divider(
              color: AppColors.lightGrey.withOpacity(0.5),
              thickness: 5,
              height: 20,
            ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              genre,
              style: AppFonts.titleStyle,
            ),
          ),
          SizedBox(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: genreMovies.length,
              itemBuilder: (context, index) {
                final movie = genreMovies[index];
                return GestureDetector(
                  onTap: () => onMovieSelected(movie),
                  child: SizedBox(
                    width: 120,
                    child: MovieWidget(
                      movie: movie,
                      onMovieSelected: onMovieSelected,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}
