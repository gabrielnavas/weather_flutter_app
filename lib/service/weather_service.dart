class CurrentWeatherRequest {
  final String city;

  CurrentWeatherRequest({
    required this.city,
  });
}

enum Unit { metric, imperial }

class Temperature {
  final double value;
  final Unit unit;

  Temperature({
    required this.value,
    required this.unit,
  });
}

class CurrentWeatherResponse {
  final Temperature temperature;

  CurrentWeatherResponse({
    required this.temperature,
  });
}

abstract class WeatherService {
  Future<CurrentWeatherResponse> currentWeather(CurrentWeatherRequest request);
}
