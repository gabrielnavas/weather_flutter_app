import 'package:weather_app/models/temperature.dart';
import 'package:weather_app/models/weather_state.dart';
import 'package:weather_app/service/weather_mock_service.dart';

class CurrentWeather {
  final Temperature temperature;
  late final WeatherState weatherState;

  CurrentWeather({
    required this.temperature,
    required String weatherDescription,
  }) {
    weatherState = WeatherState.byDescryption(weatherDescription);
  }
}

abstract class WeatherService {
  Future<CurrentWeather> currentWeather(final String city);

  factory WeatherService() {
    return WeatherMockService();
  }
}
