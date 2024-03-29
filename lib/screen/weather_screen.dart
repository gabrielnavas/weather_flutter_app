import 'package:flutter/material.dart';
import 'package:weather_app/models/temperature.dart';
import 'package:weather_app/service/weather_service.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final WeatherService weatherService = WeatherService();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
        title: const Text(
          "Tempo agora",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
      ),
      body: FutureBuilder(
        future: weatherService.currentWeather("Presidente Prudente"),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: Text("Carrengando...\nAguarde!"),
            );
          }

          if (!snapshot.hasData) {
            return const Center(
              child: Text("Tente novamente mais tarde"),
            );
          }

          final CurrentWeather currentWeather = snapshot.data!;

          const double circularRadius = 25;

          return SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                SizedBox(
                  height: 170,
                  width: 250,
                  child: Stack(
                    children: [
                      Positioned(
                        bottom: 10,
                        left: -40,
                        child: Image.asset(
                          "assets/weather/icons/01.png",
                          scale: .35,
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 75,
                        child: Container(
                          padding: const EdgeInsets.all(5),
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
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 5,
                                    right: 0,
                                    child: Text(
                                      currentWeather.temperature.unit ==
                                              TemperateUnit.imperial
                                          ? 'F'
                                          : 'C',
                                      style: const TextStyle(
                                          fontSize: 20, color: Colors.black54),
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                currentWeather.weatherState.description,
                                style: const TextStyle(fontSize: 30),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 50),
                  padding:
                      const EdgeInsets.symmetric(vertical: 25, horizontal: 15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(circularRadius),
                    color: Colors.black12,
                  ),
                  child: Column(
                    children: [
                      Text(
                        '${currentWeather.temperature.city.name} - ${currentWeather.temperature.city.state.acronym}',
                        style: const TextStyle(fontSize: 30),
                      ),
                      Text(
                        currentWeather.temperature.city.country,
                        style: const TextStyle(fontSize: 30),
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
