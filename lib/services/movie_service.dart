import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:wookie_movies_flutter_lrliwe/models/movie.dart';
class MovieService {
  final String baseUrl = 'https://wookie.codesubmit.io/movies';

  Future<List<Movie>> fetchMovies() async {
    final response = await http.get(
      Uri.parse(baseUrl),
      headers: {'Authorization': 'Bearer Wookie2021'},
    );
    if (response.statusCode == 200) {
      final List moviesJson = json.decode(response.body)['movies'];
      return moviesJson.map((json) => Movie.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load movies');
    }
  }
  Future<List<Movie>> searchMovies(String query) async {
    final response = await http.get(
      Uri.parse('$baseUrl?q=$query'),
      headers: {'Authorization': 'Bearer Wookie2021'},
    );
    if (response.statusCode == 200) {
      final List moviesJson = json.decode(response.body)['movies'];
      return moviesJson.map((json) => Movie.fromJson(json)).toList();
    } else {
      throw Exception('Failed to search movies');
    }
  }
}
