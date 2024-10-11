import 'package:flutter/material.dart';
import 'package:cinemania/core/movie_category.dart';
import 'package:cinemania/core/movie_list.dart';
import 'package:cinemania/core/navigation_handler.dart';
import 'package:cinemania/screens/category_screen.dart';
import 'package:cinemania/style.dart';

class DrawerGroup {

  static Drawer basicDrawer(BuildContext context) {
    return Drawer(
      elevation: 4.0,
      child: ListView(
        children: [
          AppBar(
            title: const Text("Categories"),
            automaticallyImplyLeading: false,
          ),
          const SizedBox(height: 8.0),
          for (MovieCategory movieCategory in MovieList.categories)
            ListTile(
              style: ListTileStyle.drawer,
              dense: true,
              visualDensity: VisualDensity.compact,
              title: Text(
                movieCategory.label,
                style: StyleData.darkTheme.textTheme.labelMedium,
              ),
              onTap: () => 
                NavigationHandler.onTranstionedToNewPage(
                  context, 
                  CategoryScreen(movieCategory: movieCategory),
                ),
            ),
        ],
      ),
    );
  }
}
