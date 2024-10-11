import 'package:flutter/material.dart';
import 'package:cinemania/core/movie.dart';
import 'package:cinemania/style.dart';

class BulletInfo extends StatelessWidget {
  const BulletInfo({
    super.key,
    required this.movie,
  });

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 48.0, vertical: 2.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text(
                "Year",
                style: StyleData.darkTheme.textTheme.displayMedium?.copyWith(color: const Color.fromARGB(255, 206, 52, 233)),
              ),
              Text(
                movie.year.substring(0, 4), 
                style: StyleData.darkTheme.textTheme.displayMedium?.copyWith(
                  fontSize: 18.0,
                ),
              ),
            ],
          ),
          Column(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 4.0),
                child: Icon(Icons.star_purple500_sharp, color: Color(0xFFF7B800)),
              ),
              Text(
                movie.voteAverage,
                style: StyleData.darkTheme.textTheme.displayMedium?.copyWith(
                  fontSize: 18.0,
                ),
              ),
            ],
          ),
          Column(
            children: [
              Text(
                "Runtime",
                style: StyleData.darkTheme.textTheme.displayMedium?.copyWith(color: Colors.green),
              ),
              Text(
                movie.runtime.toString(),
                style: StyleData.darkTheme.textTheme.displayMedium?.copyWith(
                  fontSize: 18.0,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
