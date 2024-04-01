import 'package:flutter/material.dart';
import 'package:weather_app/models/current_weather.dart';
import 'package:weather_app/screen/waiting.dart';
import 'package:weather_app/service/current_location_service.dart';
import 'package:weather_app/service/weather_service.dart';
import 'package:weather_app/widgets/current_weather_widget.dart';
import 'package:weather_app/widgets/image_weather_widget.dart';
import 'package:weather_app/widgets/location_widget.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  final TextEditingController _locationController = TextEditingController();

  String _city = "";

  @override
  void initState() {
    super.initState();
    getCurrentLocation().catchError((value) => {print("vix")});
  }

  @override
  Widget build(BuildContext context) {
    final WeatherService weatherService = WeatherService();

    return Scaffold(
      appBar: _appBar(),
      body: _futureBuilder(weatherService),
    );
  }

  Future<void> getCurrentLocation() async {
    final placemark = await CurrentLocationService().location();
    setState(() => _city = placemark.administrativeArea!);
  }

  FutureBuilder<CurrentWeather?> _futureBuilder(WeatherService weatherService) {
    return FutureBuilder(
      future: weatherService.currentWeather(_city),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Waiting(text: "Carrengando...\nAguarde!");
        }

        final bool isSunny =
            snapshot.hasData ? snapshot.data!.weatherState.sunny : false;

        const double circularRadius = 25;

        return _afterWaiting(isSunny, circularRadius, snapshot.data);
      },
    );
  }

  Container _afterWaiting(
    bool isSunny,
    double circularRadius,
    CurrentWeather? currentWeather,
  ) {
    return Container(
      padding: const EdgeInsets.only(top: 50),
      decoration: decorationAfterWaiting(isSunny),
      width: double.infinity,
      child: Column(
        children: [
          SizedBox(
            width: 300,
            child: TextField(
              decoration: const InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black54),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color.fromARGB(255, 0, 0, 0)),
                ),
                hintText: "Informe a cidade...",
              ),
              onSubmitted: (value) => setState(() => _city = value),
              controller: _locationController,
            ),
          ),
          if (currentWeather == null)
            const Center(
              child: Text("cidade não encontrada!"),
            ),
          if (currentWeather != null && _city.isNotEmpty)
            SizedBox(
              height: 250,
              width: 250,
              child: Stack(
                children: [
                  ImageWeatherWidget(
                    imageName: currentWeather.weatherState.iconName,
                  ),
                  CurrentWeatherWidget(
                    circularRadius: circularRadius,
                    currentWeather: currentWeather,
                  ),
                ],
              ),
            ),
          if (currentWeather != null && _city.isNotEmpty)
            LocationWidget(
              circularRadius: circularRadius,
              currentWeather: currentWeather,
              isSunny: isSunny,
            )
        ],
      ),
    );
  }

  BoxDecoration decorationAfterWaiting(bool isSunny) {
    return BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: const Alignment(0.8, 1),
        colors: isSunny
            ? const [
                Color.fromARGB(255, 221, 221, 221),
                Color.fromARGB(255, 138, 132, 23),
              ]
            : const [
                Color.fromARGB(255, 187, 187, 187),
                Color.fromARGB(255, 38, 48, 50),
              ],
        tileMode: TileMode.mirror,
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment(0.8, 1),
            colors: [Color.fromARGB(255, 206, 206, 206), Colors.blueAccent],
            tileMode: TileMode.mirror,
          ),
        ),
      ),
      centerTitle: true,
      title: const Text(
        "Tempo agora",
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 25,
        ),
      ),
    );
  }
}
