import 'countrylistmodel.dart';

class SearchCountriesResultResponse {
  final String statusCode;
  final List<CountryList>? countriesData;
  final String message;

  SearchCountriesResultResponse({
    required this.statusCode,
    this.countriesData,
    required this.message,
  });
}
