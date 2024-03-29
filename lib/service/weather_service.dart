import 'package:weather_app/models/temperature.dart';
import 'package:weather_app/models/weather_state.dart';

class CurrentWeather {
  final Temperature temperature;
  final WeatherState weatherState;

  CurrentWeather({
    required this.temperature,
    required this.weatherState,
  });
}

abstract class WeatherService {
  Future<CurrentWeather> currentWeather(final String city);
}
