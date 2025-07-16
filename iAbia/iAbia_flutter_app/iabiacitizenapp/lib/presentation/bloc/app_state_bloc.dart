import 'dart:async';
import 'dart:ui';
import 'package:bloc/bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'app_state_event.dart';
part 'app_state_state.dart';

class AppStateBloc extends Bloc<AppStateEvent, AppStateState> {
  AppStateBloc() : super(AppStateState()) {
    on<AppStateEvent>((event, emit) {});
    on<SetLocaleEvent>(_onSetLocaleEvent);
    on<DisplayLanguageSelectionEvent>(_onDisplayLanguageSelectionEvent);
    on<ChatAvailabilityStatusEvent>(_onChatAvailabilityStatusEvent);
  }

  FutureOr<void> _onSetLocaleEvent(
    SetLocaleEvent event,
    Emitter<AppStateState> emit,
  ) async {
    // final newLocale = Locale(event.languageCode);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('locale', event.languageCode);
    emit(AppStateState());
  }

  FutureOr<void> _onDisplayLanguageSelectionEvent(
    DisplayLanguageSelectionEvent event,
    Emitter<AppStateState> emit,
  ) async {
    return emit(DisplayLanguageSelectionState());
  }

  FutureOr<void> _onChatAvailabilityStatusEvent(
    ChatAvailabilityStatusEvent event,
    Emitter<AppStateState> emit,
  ) {
    print(event.isChatAvailable);
    print('event to check empty state called');
    if (event.isChatAvailable) {
      emit(ChatIsNotAvailableStatusState());
    } else if (!event.isChatAvailable) {
      emit(ChatIsAvailableStatusState());
    }
  }
}
