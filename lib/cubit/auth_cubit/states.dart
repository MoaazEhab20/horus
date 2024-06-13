import 'package:final_project/models/signup_model.dart';

abstract class SignUpStates {}

class SignUpInitialStates extends SignUpStates {}

class SignUpSuccessStates extends SignUpStates {
  SignUpModel signUpModel;
  SignUpSuccessStates({required this.signUpModel});
}

class SignUpLoadingStates extends SignUpStates {}

class SignUpErrorStates extends SignUpStates {
  final String error;

  SignUpErrorStates(this.error);
}
