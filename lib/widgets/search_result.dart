import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cinemania/core/movie.dart';
import 'package:cinemania/core/navigation_handler.dart';
import 'package:cinemania/screens/overview_screen.dart';
import 'package:cinemania/style.dart';

class SearchResult extends StatelessWidget {
  const SearchResult({super.key, required this.movie});

  final Movie movie;
  final EdgeInsets margin = const EdgeInsets.only(top: 4.0, right: 8.0);

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      margin: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 44, 44, 44),
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(color: const Color.fromARGB(255, 56, 56, 56)),
      ),
      child: GestureDetector(
        onLongPress: () {
          HapticFeedback.vibrate();
          Clipboard.setData(ClipboardData(text: movie.title));
          ScaffoldMessenger.of(context).clearSnackBars();
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Title Copied to Clipboard."),
              ),
          );
        },
        onTap: () => NavigationHandler.onTranstionedToNewPage(
            context,
            OverviewScreen(
              movieID: movie.tmdbID.toString(),
            ),
        ),
        child: Row(
          children: [
            Image.network(
              movie.cover,
              width: 70,
              height: 100,
              fit: BoxFit.fill,
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                    movie.title,
                    textAlign: TextAlign.left,
                    overflow: TextOverflow.ellipsis,
                    style: StyleData.darkTheme.textTheme.displayMedium
                        ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    Text(
                    movie.originalTitle,
                    textAlign: TextAlign.left,
                    overflow: TextOverflow.ellipsis,
                    style: StyleData.darkTheme.textTheme.displayMedium,
                    ),
                    Text(
                      movie.year,
                      style: StyleData.darkTheme.textTheme.displayMedium
                          ?.copyWith(color: Colors.grey),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 0.0),
                      child: Row(
                        children: [
                          const Icon(Icons.star_purple500_outlined,
                              color: Color(0xFFF7B800), size: 15),
                          const SizedBox(width: 4.0),
                          Text(
                            "${movie.voteAverage}/10",
                            style: StyleData.darkTheme.textTheme.displayMedium
                                ?.copyWith(color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
