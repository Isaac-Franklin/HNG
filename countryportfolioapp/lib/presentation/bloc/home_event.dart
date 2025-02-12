part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class FetchCountryListEvent extends HomeEvent {}

class FetchCountryDetailsEvent extends HomeEvent {
  final String countryName;

  FetchCountryDetailsEvent({required this.countryName});
}

class SearchCountryEvent extends HomeEvent {
  final String searchQuery;

  SearchCountryEvent({required this.searchQuery});
}

class SearchingEvent extends HomeEvent {
  final String message;

  SearchingEvent({required this.message});
}
