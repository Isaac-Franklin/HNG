// ignore_for_file: avoid_print, non_constant_identifier_names

import '../models/allcountriesresponsemodel.dart';
import '../models/countrylistmodel.dart';
import '../models/countrymodel.dart';
import '../models/countryresponsemodel.dart';
import '../models/searchcountryresponsemodel.dart';
import 'connectapi.dart';

class RepositoryServices {
  final dio = ApiService().dio;

// Fetch all countries information starts here
  Future<AllCountriesListResponse> fetchCountryListFxn(pagecount, page) async {
    String countriesSearchUrl =
        'https://restfulcountries.com/api/v1/countries?per_page=$pagecount&page=$page';
    final List<CountryList> countryDataList = [];

    // API request
    final response = await dio.get(countriesSearchUrl);
    // print(response);
    final dataResponse = response.data['data'];

    if (dataResponse != null) {
      for (var element in dataResponse) {
        if (element['href']['flag'] != null) {
          // Parse the country info into the model
          CountryList countryData = CountryList(
            countryName: element['name'] ?? 'Not Found',
            countryFullName: element['capital'] ?? 'Not Found',
            flag: element['href']['flag'] ?? 'Not Found',
          );
          countryDataList.add(countryData);
        }
      }

      final AllCountriesListResponse allCountriesData =
          AllCountriesListResponse(
        statusCode: '200',
        countriesData: countryDataList,
        message: 'All country data found.',
      );
      // print(countryDataList);
      return allCountriesData;
    } else {
      final AllCountriesListResponse allCountriesData =
          AllCountriesListResponse(
        statusCode: '400',
        message: 'An error occured.',
      );
      return allCountriesData;
    }
  }
  // fetch all countries information ends here

  // Fetch single country information starts here
  Future<SingleCountryListResponse> fetchCountryDataFxn(country) async {
    String fetchProfileUrl =
        'https://restfulcountries.com/api/v1/countries/$country';

    // API request
    final response = await dio.get(fetchProfileUrl);
    final dataResponse = response.data['data'];
    // print(dataResponse);

    if (dataResponse != null) {
      // Parse the country info into the model
      CountryModel countryInfo = CountryModel(
        countryName: dataResponse['full_name'] ?? 'Not Found',
        president: dataResponse['href']['self'] ?? 'Not Found',
        picture1: dataResponse['href']['states'] ?? 'Not Found',
        picture2: dataResponse['href']['picture'] ?? 'Not Found',
        flag: dataResponse['href']['flag'] ?? 'Not Found',
        population: dataResponse['population'] ?? 'Not Found',
        capital: dataResponse['capital'] ?? 'Not Found',
        motto: dataResponse['continent'] ?? 'Not Found',
        officialLang: dataResponse['officialLang'] ?? 'Not Found',
        ethnicGroup: dataResponse['ethnicGroup'] ?? 'Not Found',
        religion: dataResponse['religion'] ?? 'Not Found',
        government: dataResponse['government'] ?? 'Not Found',
        independenceData: dataResponse['independence_date'] ?? 'Not Found',
        areaSize: dataResponse['size'] ?? 'Not Found',
        currency: dataResponse['currency'] ?? 'Not Found',
        gdp: dataResponse['gdp'] ?? 'Not Found',
        timeZone: dataResponse['timeZone'] ?? 'Not Found',
        dateFormat: dataResponse['dateFormat'] ?? 'Not Found',
        dailCode: dataResponse['phone_code'] ?? 'Not Found',
        drivingSide: dataResponse['drivingSide'] ?? 'Not Found',
      );

      final SingleCountryListResponse countryDataMain =
          SingleCountryListResponse(
        statusCode: '200',
        countryData: countryInfo,
        message: 'Country data found.',
      );
      return countryDataMain;
    } else {
      final SingleCountryListResponse countryDataMain =
          SingleCountryListResponse(
        statusCode: '400',
        message: 'An error occured.',
      );
      return countryDataMain;
    }
  }
  // fetch single country data ends here

  // Search functionality starts here
  Future<SearchCountriesResultResponse> searchCountryFxn(
      String countryName) async {
    print('main function called with country name');
    String searchcountryUrl =
        // 'https://restfulcountries.com/api/v1/countries/Nigeria';
        'https://restfulcountries.com/api/v1/countries/$countryName';
    final List<CountryList> countryDataList = [];

    // API request
    final response = await dio.get(searchcountryUrl);
    print('response');
    print(response);
    final dataResponse = response.data['data'];

    if (dataResponse != null) {
      // for (var element in dataResponse) {
      if (dataResponse['href']['flag'] != null) {
        // Parse the country info into the model
        CountryList countryData = CountryList(
          countryName: dataResponse['name'] ?? 'Not Found',
          countryFullName: dataResponse['full_name'] ?? 'Not Found',
          flag: dataResponse['href']['flag'] ?? 'Not Found',
        );
        countryDataList.add(countryData);
        // }
      }

      final SearchCountriesResultResponse allCountriesData =
          SearchCountriesResultResponse(
        statusCode: '200',
        countriesData: countryDataList,
        message: 'All country data found.',
      );
      print('countryDataList');
      print(countryDataList);
      return allCountriesData;
    } else {
      final SearchCountriesResultResponse allCountriesData =
          SearchCountriesResultResponse(
        statusCode: '400',
        message: 'An error occured.',
      );
      return allCountriesData;
    }
  }
  // Search functionality ends here
}
