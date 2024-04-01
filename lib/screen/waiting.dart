import 'package:flutter/material.dart';

class Waiting extends StatelessWidget {
  final String text;

  const Waiting({required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black12,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircularProgressIndicator(
              color: Colors.blueAccent,
            ),
            const SizedBox(
              height: 25,
            ),
            Text(
              text,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
          ],
        ),
      ),
    );
  }
}
