import 'package:flutter/material.dart';
import 'package:cinemania/core/data_fetcher.dart';
import 'package:cinemania/style.dart';
import 'package:flutter/services.dart';

class CastCard extends StatelessWidget {
  const CastCard(
      {super.key, required this.castName, required this.castProfileImage});

  final String castName;
  final String castProfileImage;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        HapticFeedback.vibrate();
        Clipboard.setData(ClipboardData(text: castName));
        ScaffoldMessenger.of(context).clearSnackBars();
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Name Copied to Clipboard."),
            ),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              image: DecorationImage(
                  image: NetworkImage(
                      DataFetcher.baseImageURL + castProfileImage)),
            ),
            alignment: Alignment.bottomCenter,
            clipBehavior: Clip.hardEdge,
            width: 125,
            height: 185,
            child: Container(
              color: const Color.fromARGB(179, 0, 0, 0),
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
              width: double.infinity,
              child: Text(
                castName,
                style: StyleData.darkTheme.textTheme.labelLarge
                    ?.copyWith(fontSize: 14.0, fontWeight: FontWeight.w300),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
