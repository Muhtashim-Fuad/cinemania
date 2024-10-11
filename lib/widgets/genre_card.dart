import 'package:flutter/material.dart';
import 'package:cinemania/style.dart';

class GenreCard extends StatelessWidget {
  const GenreCard({super.key, required this.value, required this.margin});

  final EdgeInsets margin;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 4.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
          border: Border.all(color: Colors.grey, width: 0.5)),
      child: Text(
        value,
        style: StyleData.darkTheme.textTheme.labelSmall?.copyWith(
          color: Colors.grey,
        ),
      ),
    );
  }
}
