import 'package:weather_app/models/state_country.dart';

class City {
  final String name;
  final StateCountry state;
  final String country;

  City({
    required this.name,
    required this.state,
    required this.country,
  });
}
