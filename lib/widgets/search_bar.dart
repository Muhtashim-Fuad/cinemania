import 'package:flutter/material.dart';
import 'package:cinemania/style.dart';

class ExtendedSearchBar extends StatelessWidget {
  final Function(String) onSubmitted;

  const ExtendedSearchBar({super.key, required this.onSubmitted});

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: StyleData.darkTheme.textTheme.displayMedium,
      cursorColor: const Color.fromRGBO(196, 196, 196, 1),
      onSubmitted: onSubmitted,
      decoration: const InputDecoration(
        prefixIcon: Icon(Icons.search, size: 25),
        hintText: 'Search By Title',
      ),
    );
  }
}
