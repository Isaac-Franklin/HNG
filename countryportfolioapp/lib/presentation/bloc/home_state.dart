part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

class FetchCountyListState extends HomeState {
  final List<CountryList>? countries;

  FetchCountyListState({required this.countries});
}

class LoadingState extends HomeState {
  final String? messsage;

  LoadingState({required this.messsage});
}

class LoadingErrorState extends HomeState {
  final String errorMessage;

  LoadingErrorState({required this.errorMessage});
}

class FetchCountryDetailsState extends HomeState {
  final CountryModel? countryDetails;

  FetchCountryDetailsState({required this.countryDetails});
}

class SearchResultState extends HomeState {
  final List<CountryList>? searchResults;

  SearchResultState({required this.searchResults});
}
