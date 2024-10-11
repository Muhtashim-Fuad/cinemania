import 'package:flutter/material.dart';
import 'package:cinemania/core/movie.dart';
import 'package:cinemania/style.dart';
import 'package:cinemania/widgets/movie_grid.dart';

class GridContainer extends StatelessWidget {
  const GridContainer({
    super.key,
    required this.movies, required this.title,
  });

  final String title;
  final List<Movie> movies;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          padding: const EdgeInsets.only(
              left: 14.0, right: 14.0, top: 24.0, bottom: 4.0),
          child: Text(
            title,
            style: StyleData.darkTheme.textTheme.displayLarge?.copyWith(
              fontSize: 18.0,
              fontWeight: FontWeight.w500,
              letterSpacing: -0.5,
            ),
          ),
        ),
        MovieGrid(movieList: movies),
      ],
    );
  }
}
