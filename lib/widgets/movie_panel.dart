import 'package:flutter/material.dart';
import 'package:cinemania/core/movie.dart';
import 'package:cinemania/core/navigation_handler.dart';
import 'package:cinemania/screens/overview_screen.dart';
import 'package:ripple_image_button/ripple_image_button.dart';

class MoviePanel extends StatelessWidget {
  final Movie movie;
  const MoviePanel({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return RippleImageButton(
      borderRadius: 8.0,
      fit: BoxFit.fill,
      margin: const EdgeInsets.all(2.0),
      image: NetworkImage(movie.cover),
      onTap: ()  => NavigationHandler.onTranstionedToNewPage(
          context,
          OverviewScreen(
            movieID: movie.tmdbID.toString(),
          ),
        ),
    );
  }
}
