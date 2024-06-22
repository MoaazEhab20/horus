import 'dart:convert';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

part 'register_tour_guide__state.dart';

class RegisterTourGuideCubit extends Cubit<RegisterTourGuideState> {
  RegisterTourGuideCubit() : super(RegisterTourguideInitial());

  static RegisterTourGuideCubit get(context) => BlocProvider.of(context);

  String? image;
  final ImagePicker picker = ImagePicker();
  List<int> selectedLanguageIds = [];

  void openGallery(BuildContext context) async {
    try {
      final XFile? pickedImage =
          await picker.pickImage(source: ImageSource.gallery);
      if (pickedImage != null) {
        File imageFile = File(pickedImage.path);
        image = pickedImage.path;
      }
    } catch (e) {
      print('Error picking image: $e');
    }
  }

  void setSelectedLanguages(List<int> languages) {
    selectedLanguageIds = languages;
    emit(RegisterTourguideLanguageUpdated(selectedLanguageIds));
  }

  void RegisterTourguide({
    required String name,
    required String password,
    required String gender,
    required String phone,
    required String email,
    required String confpassword,
    required String nationality,
    required int cityid,
    required int ssn,
    required List<int> languages,
    required int price,
    required String birthdate,
  }) async {
    emit(RegisterTourguideLoading());
    print(image);

    try {
      Map<String, String> headers = {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'lang': "en",
      };

      // Map the list of languages to the required format
      Map<String, String> map = {
        "name": name,
        "password": password,
        "gender": "${gender == "Male" ? 1 : 2}",
        "phone_number": phone,
        "password_confirmation": confpassword,
        "nationality": nationality,
        "city_id": "$cityid",
        "email": email,
        "ssn": "$ssn",
        "price": "$price",
        "email_type": "1",
        "birthdate": '6 / 8 / 2002'
      };

      // Add the languages to the map with the correct format
      for (int i = 0; i < languages.length; i++) {
        map["languages[$i]"] = "${languages[i]}";
      }

      Uri uri = Uri.parse("https://hoorus.online/api/register");
      var request = http.MultipartRequest('POST', uri);
      request.headers.addAll(headers);
      request.fields.addAll(map);

      if (image != null && image!.isNotEmpty) {
        request.files.add(await http.MultipartFile.fromPath('profile_pic', image!));
      }

      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);
      print('Response body: ${response.body}'); // Print the raw response body
      print('Response status: ${response.statusCode}'); // Print the status code

      var result;
      try {
        result = jsonDecode(response.body);
      } catch (e) {
        throw FormatException('Failed to decode JSON response');
      }

      if (response.statusCode >= 200 && response.statusCode < 300) {
        print(result["message"]);
        emit(RegisterTourguideSuccess());
      } else {
        emit(RegisterTourguideFailed());
        print(result["message"]);
        print(result);
      }
    } catch (e) {
      print('Error: ${e.toString()}');
      emit(RegisterTourguideFailed());
    }
  }

  void LoginTourguide({
    required String password,
    required String email,
  }) async {
    emit(RegisterTourguideLoading());
    print(image);

    try {
      Map<String, String> headers = {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'lang': "en",
      };

      Map<String, String> map = {
        "password": password,
        "email": email,
      };

      Uri uri = Uri.parse("https://hoorus.online/api/login");
      var request = http.MultipartRequest('POST', uri);
      request.headers.addAll(headers);
      request.fields.addAll(map);

      if (image != null && image!.isNotEmpty) {
        request.files.add(await http.MultipartFile.fromPath('profile_pic', image!));
      }

      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);
      print('Response body: ${response.body}'); // Print the raw response body
      print('Response status: ${response.statusCode}'); // Print the status code

      var result;
      try {
        result = jsonDecode(response.body);
      } catch (e) {
        throw FormatException('Failed to decode JSON response');
      }

      if (response.statusCode >= 200 && response.statusCode < 300) {
        print(result["message"]);
        emit(RegisterTourguideSuccess());
      } else {
        emit(RegisterTourguideFailed());
        print(result["message"]);
        print(result);
      }
    } catch (e) {
      print('Error: ${e.toString()}');
      emit(RegisterTourguideFailed());
    }
  }
}
