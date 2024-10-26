import 'package:flutter/material.dart';
import 'package:wookie_movies_flutter_lrliwe/models/movie.dart';
import 'package:wookie_movies_flutter_lrliwe/themes/fonts.dart';
import 'package:wookie_movies_flutter_lrliwe/widgets/crawling_text.dart';

class MovieDetailScreen extends StatelessWidget {
  final Movie movie;

  const MovieDetailScreen({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(movie.title)),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Image.network(
                movie.poster,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          '${movie.title} (${movie.imdbRating ?? 'N/A'})',
                          style: AppFonts.titleStyle,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 8),
                  Text(
                    '${movie.releasedOn?.year} | ${movie.length} | ${movie.director.join(', ')}',
                    style: AppFonts.subtitleStyle,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: _buildStarRating(movie.imdbRating ?? 0.0),
                  ),

                  const SizedBox(height: 16),
                  Text(
                    'Cast: ${movie.cast.join(', ')}',
                    style: AppFonts.castStyle,
                  ),
                  const SizedBox(height: 16),

                  const SizedBox(height: 8),
                  CrawlingText(text: movie.overview),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  List<Widget> _buildStarRating(double rating) {
    final stars = <Widget>[];
    int fullStars = rating ~/ 2;
    bool hasHalfStar = (rating % 2) >= 1;

    for (var i = 0; i < fullStars; i++) {
      stars.add(const Icon(Icons.star, color: Colors.amber));
    }

    if (hasHalfStar) {
      stars.add(const Icon(Icons.star_half, color: Colors.amber));
    }

    while (stars.length < 5) {
      stars.add(const Icon(Icons.star_border, color: Colors.amber));
    }

    return stars;
  }
}
