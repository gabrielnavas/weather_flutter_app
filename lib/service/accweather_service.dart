import 'dart:convert';

import 'package:weather_app/models/city.dart';
import 'package:weather_app/models/country.dart';
import 'package:weather_app/models/current_weather.dart';
import 'package:weather_app/models/state_country.dart';
import 'package:weather_app/models/temperature.dart';
import 'package:weather_app/models/accweather_city_search_response.dart';
import 'package:weather_app/models/accweather_current_weather_model.dart';
import 'package:weather_app/service/weather_service.dart';

import 'package:http/http.dart' as http;

class AccweatherService implements WeatherService {
  @override
  Future<CurrentWeather?> currentWeather(final String city) async {
    if (city.isEmpty) {
      return null;
    }
    final AccweatherCitySearchResponse? citySearchResponse =
        await _getCityKey(city);
    if (citySearchResponse == null) {
      return null;
    }
    final AccweatherCurrentWeatherResponse? accweatherCurrentWeatherResponse =
        await _getCurrentWeather(citySearchResponse);

    if (accweatherCurrentWeatherResponse == null) {
      return null;
    }

    return CurrentWeather(
      temperature: Temperature(
        value: accweatherCurrentWeatherResponse.temperatureMetricValue,
        unit: TemperateUnit.metric,
        city: City(
          name: citySearchResponse.cityName,
          state: StateCountry(
              name: citySearchResponse.stateName,
              acronym: citySearchResponse.stateAcronym),
          country: Country(
            name: citySearchResponse.cityName,
            acronym: citySearchResponse.stateAcronym,
          ),
        ),
      ),
      weatherDescription: accweatherCurrentWeatherResponse.weatherDescription,
    );
  }

  Future<AccweatherCurrentWeatherResponse?> _getCurrentWeather(
    AccweatherCitySearchResponse citySearchResponse,
  ) async {
    final String url =
        'http://dataservice.accuweather.com/currentconditions/v1/${citySearchResponse.key}?apikey=DefH0PKHzwj2ksqQ3MlHFH2EoZlp7vpL';
    Uri? uri = Uri.tryParse(url);
    if (uri == null) {
      throw Exception("uri is not valid");
    }

    final response = await http.get(uri);
    final data = jsonDecode(response.body);

    if (data == null) {
      return null;
    }

    return AccweatherCurrentWeatherResponse.fromJson(
      data[0] as Map<String, dynamic>,
    );
  }

  Future<AccweatherCitySearchResponse?> _getCityKey(final String city) async {
    String url =
        'http://dataservice.accuweather.com/locations/v1/cities/search?apikey=DefH0PKHzwj2ksqQ3MlHFH2EoZlp7vpL&q=$city';
    Uri? uri = Uri.tryParse(url);
    if (uri == null) {
      throw Exception("uri is not valid");
    }
    final response = await http.get(uri);
    final json = jsonDecode(response.body);

    if (json == null) {
      return null;
    }

    if (json is Map && json["Code"] == "400") {
      return null;
    }

    if (json is! List) {
      throw Exception("data is null from api");
    }

    return AccweatherCitySearchResponse.fromJson(
      json[0] as Map<String, dynamic>,
    );
  }
}
