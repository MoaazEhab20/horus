import 'package:final_project/constant.dart';
import 'package:final_project/core/utils/api_service.dart';
import 'package:final_project/cubit/update_name_state.dart';
import 'package:final_project/models/landmark_model.dart';
import 'package:final_project/models/signup_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../services/api_service.dart';

class UpdateNameCubit extends Cubit<UpdateNameStates> {
  UpdateNameCubit() : super(UpdateNameInitialStates());
  static UpdateNameCubit get(context) => BlocProvider.of(context);

  late SignUpModel signUpModel;

  void updateNameProfile({
    required String email,
    required String email_type,
    required String name,
  }) {
    emit(UpdateNameLoadingStates());
    DioHelper.postData(
      url: 'https://hoorus.online/api/updateName',
      data: {
        'email': loginEmail,
        'email_type': email_type,
        'name': updateName,
      },
    ).then((value) {
      signUpModel = SignUpModel.fromJson(value.data);
      emit(UpdateNameSuccessStates());
      loginName = updateName;
    }).catchError((error) {
      print(error);
      emit(UpdateNameErrorStates());
    });
  }
}