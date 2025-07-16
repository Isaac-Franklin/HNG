part of 'app_state_bloc.dart';

// @immutable
sealed class AppStateEvent {}

class SetLocaleEvent extends AppStateEvent {
  final String languageCode;

  SetLocaleEvent({required this.languageCode});

  // @override
  // List<Object> get props => [languageCode];
}

class DisplayLanguageSelectionEvent extends AppStateEvent {
  final Locale locale;

  DisplayLanguageSelectionEvent({required this.locale});
}

class ChatAvailabilityStatusEvent extends AppStateEvent {
  final bool isChatAvailable;

  ChatAvailabilityStatusEvent({required this.isChatAvailable});
}
