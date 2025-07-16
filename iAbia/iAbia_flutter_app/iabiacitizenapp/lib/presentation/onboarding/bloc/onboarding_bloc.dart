import 'dart:async';

import 'package:bloc/bloc.dart';
// import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'onboarding_event.dart';
part 'onboarding_state.dart';

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  OnboardingBloc() : super(OnboardingInitial()) {
    on<OnboardingEvent>((event, emit) {});
    on<CheckStartup>(_onCheckStartup);
    on<MarkSplashSeen>(_onMarkSplashSeen);
    on<MarkLoggedIn>(_onMarkLoggedIn);
  }

  Future<void> _onCheckStartup(
    CheckStartup event,
    Emitter<OnboardingState> emit,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    final hasSeenSplash = prefs.getBool('hasSeenSplash') ?? false;
    final isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
    if (!hasSeenSplash) {
      emit(SplashNotSeen());
    } else if (isLoggedIn) {
      emit(Authenticated());
    } else {
      emit(Unauthenticated());
    }
  }

  Future<void> _onMarkSplashSeen(
    MarkSplashSeen event,
    Emitter<OnboardingState> emit,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('hasSeenSplash', true);
    add(CheckStartup());
  }

  Future<void> _onMarkLoggedIn(
    MarkLoggedIn event,
    Emitter<OnboardingState> emit,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', event.isLoggedIn);
    add(CheckStartup());
  }
}
