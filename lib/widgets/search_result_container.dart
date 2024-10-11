import 'package:flutter/material.dart';
import 'package:cinemania/core/movie.dart';
import 'package:cinemania/widgets/search_result.dart';

class SearchResultContainer extends StatelessWidget {
  const SearchResultContainer({super.key, required this.movieList});

  final List<Movie> movieList;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (Movie movie in movieList)
          SearchResult(movie: movie)
      ],
    );
  }
}
