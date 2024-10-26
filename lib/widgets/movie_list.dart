import 'package:flutter/material.dart';
import 'package:wookie_movies_flutter_lrliwe/models/movie.dart';
import 'package:wookie_movies_flutter_lrliwe/themes/fonts.dart';

class MovieList extends StatelessWidget {
  final List<Movie> movies;
  final Function(Movie) onMovieSelected;

  const MovieList({super.key, required this.movies, required this.onMovieSelected});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: movies.length,
        itemBuilder: (context, index) {
          final movie = movies[index];
          return GestureDetector(
            onTap: () => onMovieSelected(movie),
            child: Container(
              width: 120,
              margin: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 160,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      image: DecorationImage(
                        image: NetworkImage(movie.poster),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    movie.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppFonts.movieName,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }


}
