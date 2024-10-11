import 'package:flutter/material.dart';
import 'package:cinemania/core/data_fetcher.dart';
import 'package:cinemania/core/movie_category.dart';
import 'package:cinemania/screens/error_screen.dart';
import 'package:cinemania/widgets/appbar_group.dart';
import 'package:cinemania/widgets/movie_grid.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key, required this.movieCategory});

  final MovieCategory movieCategory;

  Future<Widget> generateGrid() async {
    
    
    return ListView(
      children: [
        const SizedBox(height: 15),
        MovieGrid(movieList: await DataFetcher.getMovieListByGenre(movieCategory.id.toString(),),),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarGroup.basicAppBar("${movieCategory.label} Movies"),
      body: FutureBuilder<Widget>(
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
