import 'package:flutter/material.dart';
import 'package:cinemania/core/data_fetcher.dart';
import 'package:cinemania/core/movie.dart';
import 'package:cinemania/core/search_list.dart';
import 'package:cinemania/style.dart';
import 'package:cinemania/widgets/appbar_group.dart';
import 'package:cinemania/widgets/search_bar.dart';
import 'package:cinemania/widgets/search_result_container.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});
  final SearchList _movies = SearchList();

  void onSearchValueChanged(String newValue) async {
    final List<Movie> movies = await DataFetcher.getMovieListFromSearchQuery(newValue);
    _movies.setMovies(movies);
  }

  void onPageIndexChanged(String pressedIndex) async {
    final List<Movie> movies = await DataFetcher.getMovieListFromSearchQuery(pressedIndex);
    _movies.setMovies(movies);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarGroup.basicAppBar('Search Movies'),
      body: ChangeNotifierProvider<SearchList>(
        create: (_) => _movies,
        child: Consumer<SearchList>(
          builder: (context, searchList, _) {
            return ListView(
                children: [
                  //SEARCH BAR
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
                    child: ExtendedSearchBar(onSubmitted: onSearchValueChanged),
                  ),

                  //RESULT COUNT
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 8.0, bottom: 8.0, left: 14.0),
                    child: Text(
                      "Total ${searchList.getMovies.length} Results",
                      style: StyleData.darkTheme.textTheme.bodyLarge
                          ?.copyWith(
                              color: const Color.fromARGB(
                                  255, 126, 126, 126)),
                    ),
                  ),

                  //MOVIE GRID
                  SearchResultContainer(movieList: searchList.getMovies),

                ],
            );
          },
        ),
      ),
    );
  }
}
