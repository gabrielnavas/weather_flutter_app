import 'package:weather_app/models/city.dart';
import 'package:weather_app/models/country.dart';
import 'package:weather_app/models/current_weather.dart';
import 'package:weather_app/models/state_country.dart';
import 'package:weather_app/models/temperature.dart';
import 'package:weather_app/models/weather_state.dart';
import 'package:weather_app/service/weather_service.dart';

class WeatherMockService implements WeatherService {
  @override
  Future<CurrentWeather?> currentWeather(final String city) async {
    final sunnyDescription = WeatherState.states[0].description;
    return CurrentWeather(
      temperature: Temperature(
        value: 25.5,
        unit: TemperateUnit.metric,
        city: City(
          country: Country(name: "Brasil", acronym: "BR"),
          state: StateCountry(name: "São Paulo", acronym: "SP"),
          name: "Presidente Prudente",
        ),
      ),
      weatherDescription: sunnyDescription,
    );
  }
}
