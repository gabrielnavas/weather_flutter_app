import 'package:weather_app/models/temperature.dart';
import 'package:weather_app/models/weather_state.dart';

class CurrentWeather {
  final Temperature temperature;
  late final WeatherState weatherState;

  CurrentWeather({
    required this.temperature,
    required String weatherDescription,
  }) {
    weatherState = WeatherState.byWeatherDescription(weatherDescription);
  }
}
