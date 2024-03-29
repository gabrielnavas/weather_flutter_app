class WeatherState {
  static const String _pathWeatherIcons = "assets/weather/icons";

  final String iconName;
  final String description;
  final bool sunny;
  final bool cloudy;
  final String detailedDescription;

  WeatherState(
    this.iconName,
    this.description,
    this.sunny,
    this.cloudy,
    this.detailedDescription,
  );

  static WeatherState byWeatherDescription(String byWeatherDescription) {
    WeatherState? state;
    for (final WeatherState s in states) {
      if (s.description == byWeatherDescription) {
        state = s;
      }
    }

    if (state == null) {
      throw Exception("state not found");
    }

    return state;
  }

  static String getFullPathIcon(String iconName) {
    return "$_pathWeatherIcons/$iconName.png";
  }

  static List<WeatherState> states = [
    WeatherState("01", "Sunny", true, false, "Sunny"),
    WeatherState("02", "Mostly Sunny", true, false, "Mostly Sunny"),
    WeatherState("03", "Partly Sunny", true, false, "Partly Sunny"),
    WeatherState(
        "04", "Intermittent Clouds", true, false, "Intermittent Clouds"),
    WeatherState("05", "Hazy Sunshine", true, false, "Hazy Sunshine"),
    WeatherState("06", "Mostly Cloudy", true, false, "Mostly Cloudy"),
    WeatherState("07", "Cloudy", true, true, "Cloudy"),
    WeatherState("08", "Dreary", true, true, "Dreary (Overcast)"),
    WeatherState("11", "Fog", true, true, "Fog"),
    WeatherState("12", "Showers", true, true, "Showers"),
    WeatherState("13", "Mostly Cloudy w/ Showers", true, false,
        "Mostly Cloudy w/ Showers"),
    WeatherState("14", "Partly Sunny w/ Showers", true, false,
        "Partly Sunny w/ Showers"),
    WeatherState("15", "T-Storms", true, true, "T-Storms"),
    WeatherState("16", "Mostly Cloudy w/ T-Storms", true, false,
        "Mostly Cloudy w/ T-Storms"),
    WeatherState("17", "Partly Sunny w/ T-Storms", true, false,
        "Partly Sunny w/ T-Storms"),
    WeatherState("18", "Rain", true, true, "Rain"),
    WeatherState("19", "Flurries", true, true, "Flurries"),
    WeatherState("20", "Mostly Cloudy w/ Flurries", true, false,
        "Mostly Cloudy w/ Flurries"),
    WeatherState("21", "Partly Sunny w/ Flurries", true, false,
        "Partly Sunny w/ Flurries"),
    WeatherState("22", "Snow", true, true, "Snow"),
    WeatherState(
        "23", "Mostly Cloudy w/ Snow", true, false, "Mostly Cloudy w/ Snow"),
    WeatherState("24", "Ice", true, true, "Ice"),
    WeatherState("25", "Sleet", true, true, "Sleet"),
    WeatherState("26", "Freezing Rain", true, true, "Freezing Rain"),
    WeatherState("29", "Rain and Snow", true, true, "Rain and Snow"),
    WeatherState("30", "Hot", true, true, "Hot"),
    WeatherState("31", "Cold", true, true, "Cold"),
    WeatherState("32", "Windy", true, true, "Windy"),
    WeatherState("33", "Clear", false, true, "Clear"),
    WeatherState("34", "Mostly Clear", false, true, "Mostly Clear"),
    WeatherState("35", "Partly Cloudy", false, true, "Partly Cloudy"),
    WeatherState(
        "36", "Intermittent Clouds", false, true, "Intermittent Clouds"),
    WeatherState("37", "Hazy Moonlight", false, true, "Hazy Moonlight"),
    WeatherState("38", "Mostly Cloudy", false, true, "Mostly Cloudy"),
    WeatherState("39", "Partly Cloudy w/ Showers", false, true,
        "Partly Cloudy w/ Showers"),
    WeatherState("40", "Mostly Cloudy w/ Showers", false, true,
        "Mostly Cloudy w/ Showers"),
    WeatherState("41", "Partly Cloudy w/ T-Storms", false, true,
        "Partly Cloudy w/ T-Storms"),
    WeatherState("42", "Mostly Cloudy w/ T-Storms", false, true,
        "Mostly Cloudy w/ T-Storms"),
    WeatherState("43", "Mostly Cloudy w/ Flurries", false, true,
        "Mostly Cloudy w/ Flurries"),
    WeatherState(
        "44", "Mostly Cloudy w/ Snow", false, true, "Mostly Cloudy w/ Snow")
  ];
}
