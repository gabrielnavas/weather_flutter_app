import 'package:weather_app/models/city.dart';

enum TemperateUnit { metric, imperial }

class Temperature {
  final double value;
  final TemperateUnit unit;
  final City city;

  Temperature({
    required this.value,
    required this.unit,
    required this.city,
  });
}
