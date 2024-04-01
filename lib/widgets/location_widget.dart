import 'package:flutter/material.dart';
import 'package:weather_app/models/current_weather.dart';

class LocationWidget extends StatelessWidget {
  final double circularRadius;
  final CurrentWeather currentWeather;
  final bool isSunny;

  const LocationWidget({
    required this.circularRadius,
    required this.currentWeather,
    required this.isSunny,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 50),
      padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(circularRadius),
        color: Colors.black12,
      ),
      child: Column(
        children: [
          Text(
            '${currentWeather.temperature.city.name} - ${currentWeather.temperature.city.state.acronym}',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: !isSunny ? Colors.lightBlue : Colors.black54,
            ),
          ),
          Text(
            currentWeather.temperature.city.country.name,
            style: TextStyle(
                fontSize: 30,
                color: isSunny
                    ? const Color.fromARGB(255, 0, 81, 147)
                    : const Color.fromARGB(255, 0, 44, 81),
                fontWeight: FontWeight.w400),
          )
        ],
      ),
    );
  }
}
