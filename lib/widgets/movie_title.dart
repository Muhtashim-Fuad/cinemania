import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:cinemania/core/movie.dart';
import 'package:cinemania/style.dart';

class MovieTitle extends StatelessWidget {
  const MovieTitle({
    super.key,
    required this.movie,
  });

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 48.0, vertical: 14.0),
      child: Center(
        child: Text.rich(
          textAlign: TextAlign.center,
          style: StyleData.darkTheme.textTheme.titleLarge?.copyWith(color: const Color.fromARGB(255, 233, 233, 233)),
          TextSpan(
            children: [
              TextSpan(
                text: movie.title,
              ),
            ],
          ),
        ),
      ),
    );
  }
}