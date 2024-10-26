class Movie {
  final String backdrop;
  final List<String> cast;
  final String classification;
  final List<String> director;
  final List<String> genres;
  final String id;
  final double? imdbRating;
  final String length;
  final String overview;
  final String poster;
  final DateTime? releasedOn;
  final String slug;
  final String title;

  Movie({
    required this.backdrop,
    required this.cast,
    required this.classification,
    required this.director,
    required this.genres,
    required this.id,
    this.imdbRating,
    required this.length,
    required this.overview,
    required this.poster,
    this.releasedOn,
    required this.slug,
    required this.title,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      backdrop: json['backdrop'],
      cast: List<String>.from(json['cast'] ?? []),
      classification: json['classification'],
      director: json['director'] is List
          ? List<String>.from(json['director'])
          : [json['director'] as String],
      genres: List<String>.from(json['genres'] ?? []),
      id: json['id'],
      imdbRating: json['imdb_rating'],
      length: json['length'],
      overview: json['overview'],
      poster: json['poster'],
      releasedOn: json['released_on'] != null
          ? DateTime.parse(json['released_on'])
          : null,
      slug: json['slug'],
      title: json['title'],
    );
  }


}
