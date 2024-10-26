import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wookie_movies_flutter_lrliwe/blocs/movie_bloc.dart';
import 'package:wookie_movies_flutter_lrliwe/blocs/movie_state.dart';
import 'package:wookie_movies_flutter_lrliwe/models/movie.dart';
import 'package:wookie_movies_flutter_lrliwe/themes/fonts.dart';
import 'package:wookie_movies_flutter_lrliwe/widgets/movie_list.dart';
import 'package:wookie_movies_flutter_lrliwe/screens/movie_details.dart';
import 'package:wookie_movies_flutter_lrliwe/themes/colors.dart';
import 'package:wookie_movies_flutter_lrliwe/widgets/movie_search.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<Movie> _filteredMovies = [];

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title: const Text('Wookie Movies'),
      ),
      body: BlocBuilder<MovieBloc, MovieState>(
        builder: (context, state) {
          if (state is MovieLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is MovieLoaded) {
            final movies = _searchController.text.isEmpty ? state.movies : _filteredMovies;
            final uniqueGenres = movies.expand((m) => m.genres).toSet().toList();

            return Column(
              children: [
                MovieSearch(
                  searchController: _searchController,
                  onMoviesFiltered: (filteredMovies) {
                    setState(() {
                      _filteredMovies = filteredMovies;
                    });
                  },
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: uniqueGenres.length,
                    itemBuilder: (context, index) {
                      final genre = uniqueGenres[index];
                      return _buildGenreSection(genre, movies, context, index != 0);
                    },
                  ),
                ),
              ],
            );
          } else if (state is MovieError) {
            return const Center(child: Text('Error loading movies'));
          } else {
            return const Center(child: Text('Unexpected state'));
          }
        },
      ),
    );
  }

  Widget _buildGenreSection(String genre, List<Movie> movies, BuildContext context, bool showDivider) {
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
                  onTap: () => _navigateToDetails(context, movie),
                  child: SizedBox(
                    width: 120,
                    child: MovieList(
                      movies: [movie],
                      onMovieSelected: (selectedMovie) =>
                          _navigateToDetails(context, selectedMovie),
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

  void _navigateToDetails(BuildContext context, Movie movie) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MovieDetailScreen(movie: movie),
      ),
    );
  }
}
