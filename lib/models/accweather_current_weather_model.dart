class AccweatherCurrentWeatherResponse {
  late double temperatureMetricValue;
  late String weatherDescription;

  AccweatherCurrentWeatherResponse.fromJson(Map<String, dynamic> json) {
    temperatureMetricValue = json["Temperature"]["Metric"]["Value"];
    weatherDescription = json["WeatherText"];
  }
}
