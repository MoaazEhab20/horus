part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class RegisterInitial extends AuthState {}

final class RegisterLoading extends AuthState {}

final class RegisterSuccess extends AuthState {}

final class RegisterFailed extends AuthState {
  final String message;

  RegisterFailed({required this.message});
}

final class LoginLoading extends AuthState {}

final class LoginSuccess extends AuthState {}

final class LoginFailed extends AuthState {
  final String message;

  LoginFailed({required this.message});
}

class UpdateNameInitialStates extends AuthState {}

class UpdateNameSuccessStates extends AuthState {}

class UpdateNameLoadingStates extends AuthState {}

class UpdateNameErrorStates extends AuthState {}

class BuyMoneyLoadingState extends AuthState {}

class BuyMoneySuccessState extends AuthState {
  final String message;

  BuyMoneySuccessState({required this.message});
}

class BuyMoneyFauilreState extends AuthState {
  final String error;

  BuyMoneyFauilreState({required this.error});
}