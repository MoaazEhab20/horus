import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:dio/dio.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(RegisterInitial());

  final dio = Dio();

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
      print('data${responseBody['user']}');
      if (responseBody['message'] == 'Login success') {
        emit(LoginSuccess());
      } else {
        emit(LoginFailed(message: responseBody['message']));
      }
    } catch (e) {
      emit(LoginFailed(message: e.toString()));
    }
  }
}
