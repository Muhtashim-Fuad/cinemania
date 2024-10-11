import 'package:flutter/material.dart';
import 'package:cinemania/core/movie.dart';
import 'package:cinemania/screens/error_screen.dart';
import 'package:cinemania/widgets/movie_panel.dart';

class MovieGrid extends StatelessWidget {
  const MovieGrid({super.key, required this.movieList});
  final List<Movie> movieList;

  Future<Widget> generateGrid() async {
    return GridView.count(
      physics: const NeverScrollableScrollPhysics(), // To disable GridView's scrolling
      shrinkWrap: true, // You won't see infinite size error
      childAspectRatio: 6 / 9,
      crossAxisCount: 3,
      children: [
        for (int i = 0; i < movieList.length; i++)
          MoviePanel(movie: movieList[i]),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
      child: FutureBuilder<Widget>(
        future: generateGrid(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return ErrorScreen(altScreen: this);
          } else {
            return snapshot.data!;
          }
        },
      ),
    );
  }
}
