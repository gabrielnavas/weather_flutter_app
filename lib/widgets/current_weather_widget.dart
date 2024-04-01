import 'package:flutter/material.dart';
import 'package:weather_app/models/current_weather.dart';
import 'package:weather_app/models/temperature.dart';

class CurrentWeatherWidget extends StatelessWidget {
  final double circularRadius;
  final CurrentWeather currentWeather;

  const CurrentWeatherWidget({
    required this.circularRadius,
    required this.currentWeather,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 5,
      right: 45,
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 20,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(circularRadius),
          color: Colors.black12,
        ),
        child: Column(
          children: [
            Stack(
              children: [
                Text(
                  '${currentWeather.temperature.value.toString()}°',
                  style: const TextStyle(
                    fontSize: 45,
                    color: Colors.white,
                  ),
                ),
                Positioned(
                  bottom: 5,
                  right: 0,
                  child: Text(
                    currentWeather.temperature.unit == TemperateUnit.imperial
                        ? 'F'
                        : 'C',
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white60,
                    ),
                  ),
                ),
              ],
            ),
            Text(
              currentWeather.weatherState.description,
              style: const TextStyle(
                fontSize: 30,
                color: Colors.white60,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
