class AccweatherCitySearchResponse {
  late String cityName;
  late String stateName;
  late String stateAcronym;
  late String countryAcronym;
  late String countryName;
  late String key;

  AccweatherCitySearchResponse.fromJson(Map<String, dynamic> json) {
    cityName = json["EnglishName"];
    stateName = json["AdministrativeArea"]["EnglishName"];
    stateAcronym = json["AdministrativeArea"]["CountryID"];
    countryAcronym = json["Country"]["ID"];
    countryName = json["Country"]["EnglishName"];
    key = json["Key"];
  }
}
