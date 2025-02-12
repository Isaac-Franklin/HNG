import 'countrylistmodel.dart';

class AllCountriesListResponse {
  final String statusCode;
  final List<CountryList>? countriesData;
  final String message;

  AllCountriesListResponse({
    required this.statusCode,
    this.countriesData,
    required this.message,
  });
}
