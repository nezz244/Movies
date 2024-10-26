import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wookie_movies_flutter_lrliwe/screens/home_screen.dart';
import 'package:wookie_movies_flutter_lrliwe/blocs/movie_bloc.dart';
import 'package:wookie_movies_flutter_lrliwe/services/movie_service.dart';
import 'package:wookie_movies_flutter_lrliwe/blocs/movie_event.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize the MovieService which will be injected into the MovieBloc
    final movieService = MovieService();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => MovieBloc(movieService)..add(FetchMovies()), // Fetch movies on start
        child: const HomeScreen(),
      ),
    );
  }
}
