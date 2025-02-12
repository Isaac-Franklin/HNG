class CountryModel {
  final String countryName;
  final String president;
  final String picture1;
  final String picture2;
  final String flag;
  final String population;
  final String capital;
  final String motto;
  final String officialLang;
  final String ethnicGroup;
  final String religion;
  final String government;
  final String independenceData;
  final String areaSize;
  final String currency;
  final String gdp;
  final String timeZone;
  final String dateFormat;
  final String dailCode;
  final String drivingSide;

  CountryModel({
    required this.countryName,
    required this.president,
    required this.picture1,
    required this.picture2,
    required this.flag,
    required this.population,
    required this.capital,
    required this.motto,
    required this.officialLang,
    required this.ethnicGroup,
    required this.religion,
    required this.government,
    required this.independenceData,
    required this.areaSize,
    required this.currency,
    required this.gdp,
    required this.timeZone,
    required this.dateFormat,
    required this.dailCode,
    required this.drivingSide,
  });

  Map<String, dynamic> toJson() => {
        "countryName": countryName,
        "president": president,
        "picture1": picture1,
        "picture2": picture2,
        "flag": flag,
        "population": population,
        "capital": capital,
        "motto": motto,
        "officialLang": officialLang,
        "ethnicGroup": ethnicGroup,
        "religion": religion,
        "government": government,
        "independenceData": independenceData,
        "areaSize": areaSize,
        "currency": currency,
        "gdp": gdp,
        "timeZone": timeZone,
        "dateFormat": dateFormat,
        "dailCode": dailCode,
        "drivingSide": drivingSide,
      };
}
