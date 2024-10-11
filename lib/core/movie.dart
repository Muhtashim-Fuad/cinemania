import 'package:cinemania/core/movie_category.dart';

class Movie {
  final String title;
  final String originalTitle;
  final String year;
  final String imdbID;
  final int tmdbID;
  final int runtime;
  final int voteCount;
  final String voteAverage;
  final String overview;
  final String cover;
  final String backdrop;
  final String tagline;
  final List<MovieCategory> categories;

  Movie({
    required this.title,
    required this.originalTitle,
    required this.year,
    required this.runtime,
    required this.imdbID,
    required this.overview,
    required this.cover,
    required this.tmdbID,
    required this.voteCount,
    required this.voteAverage,
    required this.backdrop,
    required this.tagline,
    required this.categories,
  });
}