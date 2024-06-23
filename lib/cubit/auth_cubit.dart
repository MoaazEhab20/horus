import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../constant.dart';
import '../services/api_service.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(RegisterInitial());

  final dio = Dio();
  static AuthCubit get(context) => BlocProvider.of(context);

  void Register({
    required String name,
    required String phone,
    required String password,
    required String email,
    required String confpassword,
    required String gender,
    required String nationality,
  }) async {
    emit(RegisterLoading());
    try {
      Response response = await dio.post(
        'https://hoorus.online/api/register',
        data: {
          "name": name,
          "password": password,
          "gender": gender == "Male" ? 1 : 2,
          "phone_number": phone,
          "password_confirmation": confpassword,
          "nationality": nationality,
          "email": email,
          "email_type": 0,
        },
        options: Options(
          headers: {
            "lang": "en",
            "Accept": "application/json",
          },
        ),
      );
      print(response.statusCode);
      var responseBody = response.data;
      print(responseBody['message']);

      if (responseBody['message'] == 'Successfully Registered') {
        emit(RegisterSuccess());
      } else {
        emit(RegisterFailed(message: responseBody['message']));
      }
    } catch (e) {
      emit(RegisterFailed(message: e.toString()));
    }
  }

  void Login({required String email, required String password}) async {
    emit(LoginLoading());
    try {
      Response response = await dio.post(
        'https://hoorus.online/api/login',
        data: {
          "email": email,
          "password": password,
        },
        options: Options(
          headers: {
            "lang": "en",
            "Accept": "application/json",
          },
        ),
      );
      var responseBody = response.data;
      loginName = responseBody['user']['name'];
      loginEmail = responseBody['user']['email'];
      token = responseBody['user']['token'];
      print(token);
      print('data${responseBody['user']}');
      print('${responseBody['user']['name']}');
      if (responseBody['message'] == 'Login success') {
        emit(LoginSuccess());
      } else {
        emit(LoginFailed(message: responseBody['message']));
      }
    } catch (e) {
      emit(LoginFailed(message: e.toString()));
    }
  }

  void updateNameProfile({
    required String email,
    required String email_type,
    required String name,
  }) {
    emit(UpdateNameLoadingStates());
    DioHelper.postData(
      url: 'https://hoorus.online/api/updateName',
      data: {
        'email': email,
        'email_type': email_type,
        'name': name,
      },
    ).then((value) {
      print(value.data);
      emit(UpdateNameSuccessStates());
    }).catchError((error) {
      print(error);
      emit(UpdateNameErrorStates());
    });
  }

  void PayMoney({
    required String card_name,
    required String card_number,
    required String exp_month,
    required String exp_year,
    required String id,
    required String cvc,
  }) {
    emit(BuyMoneyLoadingState());
    DioHelper.postData(
      url: 'https://hoorus.online/api/StripePayment/${id}',
      data: {
        'card_name': card_name,
        'card_number': card_number,
        'exp_month': exp_month,
        'exp_year': exp_year,
        'cvc': cvc,
      },
    ).then((value) {
      if (value.statusCode! >= 200 && value.statusCode! < 300) {
        emit(BuyMoneySuccessState(message: value.data["message"]));
      } else {
        if (value.statusCode == 401) {
          emit(BuyMoneyFauilreState(error: value.data["message"]));
          print(value.data["message"]);
          print(value.data);
        } else {
          emit(BuyMoneyFauilreState(error: value.data["message"]));
          print(value.data["message"]);
          print(value.data);
        }
      }
    }).catchError((error) {
      log(error.toString());
      emit(BuyMoneyFauilreState(error: error));
    });
  }

  void ForgetPassword({
    required String email,
    required String email_type,
  }) {
    print(email);
    emit(OtpLoadingState());
    DioHelper.postData(
      url: 'https://hoorus.online/api/checkEmailExists',
      data: {'email': email, "email_type": email_type},
    ).then((value) {
      print(value.data);
      print(value.statusCode);
      emit(OtpSuccessState(message: value.data['message']));
    }).catchError((error) {
      emit(OtpFauilreState(error: error.toString()));
    });
  }

  void UpdatePassword({
    required String email,
    required String email_type,
    required String password,
    required String cofirm_password,
    required String otp,
  }) {
    emit(OtpLoadingState());
    DioHelper.postData(
      url: 'https://hoorus.online/api/verifyOtpAndUpdatePassword',
      data: {
        'email': email,
        "email_type": email_type,
        "password": password,
        "password_confirmation": cofirm_password,
        "otp": otp,
      },
    ).then((value) {
      print(value.data);
      emit(OtpSuccessState(message: value.data['message']));
    }).catchError((error) {
      emit(OtpFauilreState(error: error.toString()));
    });
  }
}
