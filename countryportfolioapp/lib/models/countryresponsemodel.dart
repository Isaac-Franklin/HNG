import 'countrymodel.dart';

class SingleCountryListResponse {
  final String statusCode;
  final CountryModel? countryData;
  final String message;

  SingleCountryListResponse({
    required this.statusCode,
    this.countryData,
    required this.message,
  });
}
