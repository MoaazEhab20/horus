part of 'register_tour_guide__cubit.dart';

@immutable
abstract class RegisterTourGuideState {}

class RegisterTourguideInitial extends RegisterTourGuideState {}

class RegisterTourguideLoading extends RegisterTourGuideState {}

class RegisterTourguideSuccess extends RegisterTourGuideState {}

class RegisterTourguideFailed extends RegisterTourGuideState {}

class RegisterTourguideLanguageUpdated extends RegisterTourGuideState {
  final List<int> selectedLanguages;

  RegisterTourguideLanguageUpdated(this.selectedLanguages);
}


final class LoginLoading extends RegisterTourGuideState {}

final class LoginSuccess extends RegisterTourGuideState {
}

final class LoginFailed extends RegisterTourGuideState {
  final String message;

  LoginFailed({required this.message});
}


// final class LoginLoading extends AuthState {}

// final class LoginSuccess extends AuthState {}

// final class LoginFailed extends AuthState {
//   final String message;

//   LoginFailed({required this.message});
// }
