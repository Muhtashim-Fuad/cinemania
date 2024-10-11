import 'package:flutter/material.dart';
import 'package:cinemania/core/movie.dart';

class ImageStack extends StatelessWidget {
  const ImageStack({super.key, required this.movie});

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Image.network(movie.backdrop),
        Container(
          clipBehavior: Clip.antiAlias,
          margin: const EdgeInsets.only(top: 50),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            boxShadow: [
              BoxShadow(
                offset: Offset.zero,
                color: Colors.black45,
                blurRadius: 4.0,
                spreadRadius: 2.0,
              ),
            ],
          ),
          child: Image.network(
            movie.cover,
            width: 150,
            height: 215,
            fit: BoxFit.fill,
          ),
        ),
      ],
    );
  }
}

