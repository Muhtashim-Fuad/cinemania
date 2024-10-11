import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:cinemania/core/data_fetcher.dart';
import 'package:cinemania/core/movie.dart';
import 'package:cinemania/core/navigation_handler.dart';
import 'package:cinemania/screens/error_screen.dart';
import 'package:cinemania/screens/overview_screen.dart';
import 'package:cinemania/widgets/appbar_group.dart';
import 'package:cinemania/widgets/drawer_group.dart';
import 'package:cinemania/widgets/grid_container.dart';
import 'package:ripple_image_button/ripple_image_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  Future<Widget> generateMovieList(BuildContext context) async {
    List<Movie> topRatedMovies =
        await DataFetcher.getMovieListWithParameters("top_rated");
    List<Movie> nowPlayingMovies =
        await DataFetcher.getMovieListWithParameters("now_playing");

    return ListView(
      shrinkWrap: true,
      children: [
        CarouselSlider(
          items: [
            for (int i = 0; i < nowPlayingMovies.length; i++)
              RippleImageButton(
                image: NetworkImage(nowPlayingMovies[i].backdrop),
                onTap: () {
                  NavigationHandler.onTranstionedToNewPage(
                    context,
                    OverviewScreen(
                      movieID: nowPlayingMovies[i].tmdbID.toString(),
                    ),
                  );
                },
              ),
          ],
          options: CarouselOptions(
            enableInfiniteScroll: true,
            scrollDirection: Axis.horizontal,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 5),
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            pauseAutoPlayInFiniteScroll: false,
            viewportFraction: 1,
          ),
        ),
        GridContainer(movies: topRatedMovies, title: "IMDB Top Picks"),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarGroup.homeAppBar(context),
      drawer: DrawerGroup.basicDrawer(context),
      body: FutureBuilder<Widget>(
          future: generateMovieList(context),
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
