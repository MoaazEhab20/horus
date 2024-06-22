import 'package:dio/dio.dart';
import 'package:final_project/models/landmark_model.dart';

class FavoriteService {
  final Dio _dio = Dio();

  Future<List<Landmark>> fetchFavorites() async {
    try {
      final response = await _dio.get('https://hoorus.online/api/read_favorite_landmarks?tourist_id=1');
      if (response.statusCode == 200) {
        List<dynamic> data = response.data['landmarks'];
        List<Landmark> landmarks = data.map((landmark) => Landmark.fromJson(landmark)).toList();
        return landmarks;
      } else {
        throw Exception('Failed to load landmarks');
      }
    } catch (e) {
      throw Exception('Failed to load landmarks: $e');
    }
  }
}
