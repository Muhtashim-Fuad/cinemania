import 'package:flutter/material.dart';
import 'package:cinemania/style.dart';
import 'package:cinemania/widgets/cast_card.dart';

class CastCardContainer extends StatelessWidget {
  final List<CastCard> cardList;
  final String label;

  const CastCardContainer({super.key, required this.cardList, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: Text(
            label,
            style: StyleData.darkTheme.textTheme.displayLarge?.copyWith(
              color: const Color.fromARGB(255, 218, 218, 218),
            ),
            textAlign: TextAlign.left,
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          height: 215,
          child: ListView.separated(
            separatorBuilder: (BuildContext context, int index) =>
                const SizedBox(width: 8.0),
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(
                decelerationRate: ScrollDecelerationRate.fast),
            itemCount: cardList.length,
            itemBuilder: (context, index) => (cardList[index]),
          ),
        ),
      ],
    );
  }
}
