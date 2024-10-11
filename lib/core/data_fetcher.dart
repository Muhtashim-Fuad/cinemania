import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'package:cinemania/api_key.dart';
import 'package:cinemania/core/movie.dart';
import 'package:cinemania/core/movie_category.dart';

class DataFetcher {
  static const String baseURL = 'https://api.themoviedb.org/3/';
  static const String baseImageURL = "https://image.tmdb.org/t/p/original";
  //static const String baseImageURL = "https://image.tmdb.org/t/p/w200";

  static Future<Movie> getMovieFromID(String movieID) async {
    dynamic apiResponse = await http
        .get(Uri.parse('${baseURL}movie/$movieID?api_key=${API.key}'));
    Map<String, dynamic> json = jsonDecode(apiResponse.body);

    List<MovieCategory> categories = [];

    var genres = json['genres'];

    for (var genre in genres) {
      categories.add(MovieCategory(id: genre['id'], label: genre['name']));
    }

    return Movie(
      title: json['title'],
      originalTitle: json['original_title'],
      year: json['release_date'],
      runtime: json['runtime'],
      imdbID: json['imdb_id'] ?? "",
      tmdbID: json['id'],
      overview: json['overview'],
      voteCount: json['vote_count'],
      voteAverage: json['vote_average'].toStringAsFixed(1),
      cover: baseImageURL + json['poster_path'],
      backdrop: baseImageURL + json['backdrop_path'],
      tagline: json['tagline'],
      categories: categories,
    );
  }

  static Future<List<Movie>> getMovieListFromSearchQuery(String searchQuery,
      {String year = "", int pageNumber = 1}) async {
    final String url = '${baseURL}search/movie?api_key=${API.key}&query=$searchQuery&year=$year&page=$pageNumber';
    dynamic apiResponse = await http.get(Uri.parse(url));
    Map<String, dynamic> data = jsonDecode(apiResponse.body);

    final List<dynamic> searchResults = data['results'];
    List<Movie> movies = [];

    for (dynamic searchResult in searchResults) {
      String movieTitle = searchResult['title'] ?? "";
      if (movieTitle == "") continue;

      String movieOriginalTitle = searchResult['original_title'] ?? "";
      if (movieOriginalTitle == "") continue;

      String movieYear = searchResult['release_date'] ?? "";
      if (movieYear == "") continue;

      String moviePoster = searchResult['poster_path'] ?? '';
      if (moviePoster == "") continue;

      String movieBackdrop = searchResult['backdrop_path'] ?? '';
      if (movieBackdrop == "") continue;

      movies.add(
        Movie(
          tmdbID: searchResult['id'],
          title: movieTitle,
          originalTitle: movieOriginalTitle,
          year: movieYear,
          cover: baseImageURL + moviePoster,
          backdrop: baseImageURL + movieBackdrop,
          imdbID: '',
          runtime: 0,
          voteCount: searchResult['vote_count'],
          voteAverage: searchResult['vote_average'].toStringAsFixed(1),
          overview: searchResult['overview'],
          tagline: '',
          categories: [],
        ),
      );
    }

    return movies;
  }

  static Future<List<Movie>> getMovieListByGenre(String id) async {
    final String url =
        '${baseURL}discover/movie?api_key=${API.key}&with_genres=$id';
    dynamic apiResponse = await http.get(Uri.parse(url));
    Map<String, dynamic> data = jsonDecode(apiResponse.body);

    final List<dynamic> searchResults = data['results'];

    List<Movie> movies = [];

    for (dynamic searchResult in searchResults) {
      String movieTitle = searchResult['title'] ?? "";
      if (movieTitle == "") continue;

      String movieOriginalTitle = searchResult['original_title'] ?? "";
      if (movieOriginalTitle == "") continue;

      String movieYear = searchResult['release_date'] ?? "";
      if (movieYear == "") continue;

      String moviePoster = searchResult['poster_path'] ?? '';
      if (moviePoster == "") continue;

      String movieBackdrop = searchResult['backdrop_path'] ?? '';
      if (movieBackdrop == "") continue;

      movies.add(
        Movie(
          tmdbID: searchResult['id'],
          title: movieTitle,
          originalTitle: movieOriginalTitle,
          year: movieYear,
          cover: baseImageURL + moviePoster,
          backdrop: baseImageURL + movieBackdrop,
          imdbID: '',
          runtime: 0,
          voteCount: searchResult['vote_count'],
          voteAverage: searchResult['vote_average'].toStringAsFixed(1),
          overview: searchResult['overview'],
          tagline: '',
          categories: [],
        ),
      );
    }

    return movies;
  }

  static Future<List<Movie>> getMovieListWithParameters(String parameterString) async {
    final String url = '${baseURL}movie/$parameterString?api_key=${API.key}';
    dynamic apiResponse = await http.get(Uri.parse(url));
    Map<String, dynamic> data = jsonDecode(apiResponse.body);

    final List<dynamic> searchResults = data['results'];

    List<Movie> movies = [];

    for (dynamic searchResult in searchResults) {
      String movieTitle = searchResult['title'] ?? "";
      if (movieTitle == "") continue;

      String movieOriginalTitle = searchResult['original_title'] ?? "";
      if (movieOriginalTitle == "") continue;

      String movieYear = searchResult['release_date'] ?? "";
      if (movieYear == "") continue;

      String moviePoster = searchResult['poster_path'] ?? '';
      if (moviePoster == "") continue;

      String movieBackdrop = searchResult['backdrop_path'] ?? '';
      if (movieBackdrop == "") continue;

      movies.add(
        Movie(
          tmdbID: searchResult['id'],
          title: movieTitle,
          originalTitle: movieOriginalTitle,
          year: movieYear,
          cover: baseImageURL + moviePoster,
          backdrop: baseImageURL + movieBackdrop,
          imdbID: '',
          runtime: 0,
          voteCount: searchResult['vote_count'],
          voteAverage: searchResult['vote_average'].toStringAsFixed(1),
          overview: searchResult['overview'],
          tagline: '',
          categories: [],
        ),
      );
    }

    return movies;
  }

  static Future<List<Map<String, String>>> getCastDataFromID(String id) async {
    final String url = '${baseURL}movie/$id/credits?api_key=${API.key}';
    dynamic apiResponse = await http.get(Uri.parse(url));
    Map<String, dynamic> data = jsonDecode(apiResponse.body);

    final List<dynamic> castList = data['cast'];

    List<Map<String, String>> castDataList = [];

    final int maxCastCount = min(castList.length, 35);

    for (var castData in castList.sublist(0, maxCastCount)) {
      String castName = castData["name"] ?? "";
      String imageLink = castData["profile_path"] ?? "";

      if (castName == "" || imageLink == "") {
        continue;
      } else {
        castDataList.add({
          "name": castName,
          "profile_path": imageLink,
        });
      }
    }

    return castDataList;
  }
}
