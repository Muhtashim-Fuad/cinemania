import 'package:flutter/material.dart';
import 'package:cinemania/core/navigation_handler.dart';
import 'package:cinemania/screens/search_screen.dart';

class AppbarGroup {
  static AppBar homeAppBar(BuildContext context){
    return AppBar(
      title: Text(
        'CineMania',
        style: Theme.of(context).appBarTheme.titleTextStyle?.copyWith(
          fontSize: 24,
          fontVariations: [
            const FontVariation(
              "wght",
              700,
            ),
          ],
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: IconButton(
            onPressed: () => NavigationHandler.onTranstionedToNewPage(context, SearchScreen()), 
            icon: const Icon(Icons.search),
          ),
        ),
      ],
    );
  }
  
  static AppBar basicAppBar(String title) {
    return AppBar(
      leading: const BackButton(),
      title: Text(title),
    );
  }
}
