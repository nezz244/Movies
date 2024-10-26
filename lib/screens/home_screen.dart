import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wookie_movies_flutter_lrliwe/blocs/movie_bloc.dart';
import 'package:wookie_movies_flutter_lrliwe/blocs/movie_state.dart';
import 'package:wookie_movies_flutter_lrliwe/models/movie.dart';
import 'package:wookie_movies_flutter_lrliwe/widgets/movies_genre.dart';
import 'package:wookie_movies_flutter_lrliwe/themes/fonts.dart';
import 'package:wookie_movies_flutter_lrliwe/widgets/movie_widget.dart';
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
        title: const Align(
          alignment: Alignment.centerLeft, // Aligns text to the left
          child: Text(
            'Wookie Movies',
            style: TextStyle(
              fontWeight: FontWeight.bold, // Makes text bold
              fontSize: 20, // Adjust font size if needed
            ),
          ),
        ),
      ),
      body: BlocBuilder<MovieBloc, MovieState>(
        builder: (context, state) {
          if (state is MovieLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is MovieLoaded) {
            final movies =
                _searchController.text.isEmpty ? state.movies : _filteredMovies;
            final uniqueGenres =
                movies.expand((m) => m.genres).toSet().toList();

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
                      return MoviesGenre(
                        genre: genre,
                        movies: movies,
                        showDivider: index != 0,
                        onMovieSelected: (selectedMovie) =>
                            _navigateToDetails(context, selectedMovie),
                      );
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

  void _navigateToDetails(BuildContext context, Movie movie) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MovieDetailScreen(movie: movie),
      ),
    );
  }
}
