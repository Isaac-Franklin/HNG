class CountryList {
  final String countryName;
  final String countryFullName;
  final String flag;
  // final String capital;

  CountryList({
    required this.countryName,
    required this.countryFullName,
    required this.flag,
    // required this.capital,
  });

  Map<String, dynamic> toJson() => {
        "countryName": countryName,
        "countryFullName": countryFullName,
        "flag": flag,
        // "capital": capital,
      };
}
