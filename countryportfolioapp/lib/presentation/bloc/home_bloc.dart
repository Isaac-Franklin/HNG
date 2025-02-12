// ignore_for_file: avoid_print

import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../models/countrylistmodel.dart';
import '../../models/countrymodel.dart';
import '../../services/repository.dart';
part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(this._repositoryServices) : super(HomeInitial()) {
    on<FetchCountryListEvent>(_fetchCountyListEvent);
    on<FetchCountryDetailsEvent>(_fetchCountryDetailsEvent);
    on<SearchCountryEvent>(_searchCountryEvent);
    on<SearchingEvent>(_searchingEvent);
  }

  final RepositoryServices _repositoryServices;

  FutureOr<void> _fetchCountyListEvent(
      FetchCountryListEvent event, Emitter<HomeState> emit) async {
    print('Fetching country data...');
    emit(LoadingState(messsage: 'Loading...'));
    // fetch country list algorithm starts here
    final countryDataFetchResponse =
        await _repositoryServices.fetchCountryListFxn();

    if (countryDataFetchResponse.statusCode != '200') {
      emit(LoadingErrorState(errorMessage: countryDataFetchResponse.message));
      print(countryDataFetchResponse.message);
      print('An error occurred while fetching countries data...');
    } else {
      emit(FetchCountyListState(
          countries: countryDataFetchResponse.countriesData));
      print('Countries data found successfully');
    }
  }

  FutureOr<void> _fetchCountryDetailsEvent(
      FetchCountryDetailsEvent event, Emitter<HomeState> emit) async {
    print('Fetching country details...');
    emit(LoadingState(messsage: 'Loading...'));
    // fetch country details algorithm starts here
    final countryDetailsFetchResponse =
        await _repositoryServices.fetchCountryDataFxn(event.countryName);

    if (countryDetailsFetchResponse.statusCode != '200') {
      emit(
          LoadingErrorState(errorMessage: countryDetailsFetchResponse.message));
      print(countryDetailsFetchResponse.message);
      print('An error occurred while fetching country details');
    } else {
      emit(FetchCountryDetailsState(
          countryDetails: countryDetailsFetchResponse.countryData));
      print('Country Data found successfully');
    }
  }

  FutureOr<void> _searchCountryEvent(
      SearchCountryEvent event, Emitter<HomeState> emit) async {
    print('Fetching search country details...');
    emit(LoadingState(messsage: ''));
    final searchDetailsFetchResponse =
        await _repositoryServices.searchCountryFxn(event.searchQuery);

    if (searchDetailsFetchResponse.statusCode == '200') {
      emit(SearchResultState(
          searchResults: searchDetailsFetchResponse.countriesData));
      print('Search country data found successfully');
    } else {
      emit(LoadingErrorState(errorMessage: searchDetailsFetchResponse.message));
      print(searchDetailsFetchResponse.message);
      print('An error occurred while fetching search country details');
    }
  }

  FutureOr<void> _searchingEvent(
      SearchingEvent event, Emitter<HomeState> emit) {
    emit(LoadingState(messsage: event.message));
  }
}
