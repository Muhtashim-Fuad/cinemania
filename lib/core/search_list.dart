import 'package:flutter/material.dart';
import 'package:cinemania/core/movie.dart';

class SearchList extends ChangeNotifier {
  List<Movie> _movies = [];
  List<Movie> get getMovies => _movies;

  void setMovies(List<Movie> movies) {
    _movies.clear();
    _movies = movies;
    notifyListeners();
  }
}
