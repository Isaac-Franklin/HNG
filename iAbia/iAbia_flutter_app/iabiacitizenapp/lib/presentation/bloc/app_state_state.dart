part of 'app_state_bloc.dart';

// @immutable
class AppStateState {
  // final Locale locale;

  // const AppStateState({required this.locale});
}

final class AppStateInitial extends AppStateState {
  // const AppStateInitial({required super.locale});
}

// class LocaleState extends AppStateState {
//   final Locale locale;

//   LocaleState(this.locale);

//   // @override
//   // List<Object> get props => [locale];
// }

class DisplayLanguageSelectionState extends AppStateState {
  // DisplayLanguageSelectionState({required super.locale});
}

class ChatIsNotAvailableStatusState extends AppStateState {}

class ChatIsAvailableStatusState extends AppStateState {}
