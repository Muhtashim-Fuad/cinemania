import 'package:flutter/material.dart';

class NavigationHandler {
  static void onTranstionedToNewPage(BuildContext context, StatelessWidget pageInstance)
  {
    Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => pageInstance));
  }
}