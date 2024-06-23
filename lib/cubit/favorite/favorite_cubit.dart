import 'package:final_project/core/utils/api_service.dart';
import 'package:final_project/cubit/favorite/favorite_state.dart';
import 'package:final_project/models/landmark_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../services/api_service.dart';

class FavoriteCubit extends Cubit<FavoritesStates> {
  FavoriteCubit() : super(AddFavoritesInitialStates());
  static FavoriteCubit get(context) => BlocProvider.of(context);

  late Landmark landmark;

  void addFavorites({
    required String tourist_id,
    required String landmark_id,
  }) {
    emit(AddFavoritesLoadingStates());
    DioHelper.postData(
      url: 'https://hoorus.online/api/favorite_landmark',
      data: {
        'tourist_id': tourist_id,
        'landmark_id': landmark_id,
      },
    ).then((value) {
      landmark = Landmark.fromJson(value.data);
      emit(AddFavoritesSuccessStates());
    }).catchError((error) {
      print(error);
      emit(AddFavoritesErrorStates());
    });
  }

  void removeFavorites({
    required String id,
  }) {
    emit(RemoveFavoritesLoadingStates());
    DioHelper.postData(
      url: 'https://hoorus.online/api/remove_favourite',
      data: {
        'id': id,
      },
    ).then((value) {
      landmark = Landmark.fromJson(value.data);
      emit(RemoveFavoritesSuccessStates());
    }).catchError((error) {
      print(error);
      emit(RemoveFavoritesErrorStates());
    });
  }
}