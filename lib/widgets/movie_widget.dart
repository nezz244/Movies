import 'package:flutter/material.dart';
import 'package:wookie_movies_flutter_lrliwe/models/movie.dart';
import 'package:wookie_movies_flutter_lrliwe/themes/fonts.dart';

class MovieWidget extends StatelessWidget {
  final Movie movie;
  final Function(Movie) onMovieSelected;

  const MovieWidget(
      {super.key, required this.movie, required this.onMovieSelected});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onMovieSelected(movie),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 160,
              width: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                image: DecorationImage(
                  image: NetworkImage(movie.poster),
                  fit: BoxFit.fill,
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
  }
}
