import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/utils/api_service.dart';
import '../../models/signup_model.dart';
import 'states.dart';

class SignUpCubit extends Cubit<SignUpStates> {
  SignUpCubit() : super(SignUpInitialStates());
  SignUpCubit get(context) => BlocProvider.of(context);

  late SignUpModel signUpModel;
  void createUser({
    required String email,
    required String name,
    required String password,
    required String confirmPassword,
    required String nationality,
    required int gender,
    required String number,
    required int emailType,
    required context,
  }) {
    emit(SignUpLoadingStates());
    ApiService.postData(
      url: 'register',
      data: {
        'email': email,
        'name': name,
        'password': password,
        'password_confirmation': confirmPassword,
        'nationality': nationality,
        'gender': gender,
        'phone_number': number,
        'email_type': emailType,
      },
    ).then((value) {
      signUpModel = SignUpModel.fromJson(value.data);
      emit(SignUpSuccessStates(signUpModel: signUpModel));
    }).catchError((error) {
      emit(SignUpErrorStates(error.toString()));
    });
  }
}
