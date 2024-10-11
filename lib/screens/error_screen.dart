import 'package:flutter/material.dart';
import 'package:cinemania/style.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key, required this.altScreen});

  final Widget altScreen;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //WARNING ICON
          const Icon(
            Icons.warning_amber_rounded,
            color: Color.fromARGB(255, 158, 0, 0),
            size: 85,
          ),

          //Sized Box
          const SizedBox(height: 15),

          //Text Label
          Text(
            "Something Went Wrong!\nPlease Check Your Connectivity and\nTry Again!",
            textAlign: TextAlign.center,
            style: StyleData.darkTheme.textTheme.displayMedium,
          ),

          //Sized Box
          const SizedBox(height: 25),

          //Reload Button
          ElevatedButton(
            child: const Text('Retry'),
            onPressed: () {
              Navigator.pushReplacement
                (
                  context,
                  MaterialPageRoute(builder: (context) => altScreen),
                );
            },
          ),
        ],
      ),
    );
  }
}
