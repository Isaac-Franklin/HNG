part of 'onboarding_bloc.dart';

// @immutable
abstract class OnboardingEvent {}

class CheckStartup extends OnboardingEvent {}

class MarkSplashSeen extends OnboardingEvent {}

class MarkLoggedIn extends OnboardingEvent {
  final bool isLoggedIn;
  MarkLoggedIn(this.isLoggedIn);
}

