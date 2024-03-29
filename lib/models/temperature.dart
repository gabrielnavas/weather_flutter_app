enum Unit { metric, imperial }

class Temperature {
  final double value;
  final Unit unit;

  Temperature({
    required this.value,
    required this.unit,
  });
}
