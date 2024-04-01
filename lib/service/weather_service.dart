import 'package:weather_app/models/current_weather.dart';
import 'package:weather_app/service/accweather_service.dart';
import 'package:weather_app/service/weather_mock_service.dart';

abstract class WeatherService {
  Future<CurrentWeather?> currentWeather(final String city);

  factory WeatherService() {
    return AccweatherService();
    // return WeatherMockService();
  }
}
