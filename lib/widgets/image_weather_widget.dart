import 'package:flutter/material.dart';

class ImageWeatherWidget extends StatelessWidget {
  final String imageName;
  const ImageWeatherWidget({required this.imageName, super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 10,
      left: -25,
      child: Image.asset(
        'assets/weather/icons/$imageName.png',
        scale: .35,
      ),
    );
  }
}
