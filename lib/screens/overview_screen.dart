import 'package:flutter/material.dart';
import 'package:cinemania/core/data_fetcher.dart';
import 'package:cinemania/core/movie.dart';
import 'package:cinemania/core/movie_category.dart';
import 'package:cinemania/screens/error_screen.dart';
import 'package:cinemania/style.dart';
import 'package:cinemania/widgets/appbar_group.dart';
import 'package:cinemania/widgets/bullet_info.dart';
import 'package:cinemania/widgets/cast_card.dart';
import 'package:cinemania/widgets/cast_card_container.dart';
import 'package:cinemania/widgets/genre_card.dart';
import 'package:cinemania/widgets/image_stack.dart';
import 'package:cinemania/widgets/movie_title.dart';

class OverviewScreen extends StatelessWidget {
  const OverviewScreen({super.key, required this.movieID});

  final String movieID;
  final EdgeInsets margin =
      const EdgeInsets.only(top: 4.0, bottom: 4.0, right: 8.0);

  Future<Widget> generateScreen() async {
    final Movie movie = await DataFetcher.getMovieFromID(movieID);
    final List<Map<String, String>> castList = await DataFetcher.getCastDataFromID(movieID);

    return ListView(
      children: [
        ImageStack(movie: movie),
        MovieTitle(movie: movie),
        BulletInfo(movie: movie),
        if (movie.tagline != "")
          Container(
            margin:
                const EdgeInsets.symmetric(vertical: 18.0, horizontal: 18.0),
            padding:
                const EdgeInsets.symmetric(horizontal: 14.0, vertical: 8.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.0),
              color: const Color.fromARGB(255, 56, 56, 56),
            ),
            child: Text(
              "\"${movie.tagline}\"",
              style: StyleData.darkTheme.textTheme.labelSmall?.copyWith(
                color: const Color.fromARGB(255, 182, 182, 182),
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w100,
              ),
            ),
          )
        else
          const SizedBox(height: 35),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 8.0),
              Text(
                "Synopsis",
                textAlign: TextAlign.left,
                style: StyleData.darkTheme.textTheme.displayLarge?.copyWith(
                  color: const Color.fromARGB(255, 218, 218, 218),
                ),
              ),
              const SizedBox(height: 4.0),
              Text(
                movie.overview,
                textAlign: TextAlign.justify,
                style: StyleData.darkTheme.textTheme.labelSmall?.copyWith(
                  color: Colors.grey,
                ),
              ),

              //MOVIE CATEGORIES
              Container(
                padding: const EdgeInsets.symmetric(vertical: 18.0),
                child: Wrap(
                  children: [
                    for (MovieCategory category in movie.categories)
                      GenreCard(value: category.label, margin: margin),
                  ],
                ),
              ),

              //CAST DATA
              if (castList.isNotEmpty)
                CastCardContainer(
                  label: "Cast",
                  cardList: [
                    for (var castData in castList)
                      CastCard(
                        castName: castData["name"]!,
                        castProfileImage: castData["profile_path"]!,
                      ),
                  ],
                ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarGroup.basicAppBar("Overview"),
      body: FutureBuilder<Widget>(
          future: generateScreen(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return ErrorScreen(altScreen: this);
            } else {
              return snapshot.data!;
            }
          }),
    );
  }
}
