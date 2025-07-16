part of 'onboarding_bloc.dart';

// @immutable
abstract class OnboardingState {}

final class OnboardingInitial extends OnboardingState {}

class StartupInitial extends OnboardingState {}

class SplashNotSeen extends OnboardingState {}

class Unauthenticated extends OnboardingState {}

class Authenticated extends OnboardingState {}
