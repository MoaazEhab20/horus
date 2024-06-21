import 'package:dio/dio.dart';

import '../models/landmark_model.dart';

class RecommendedService {
  final Dio _dio = Dio();
  final String _endpoint =
      'https://hoorus.online/api/read_landmark_recommended?city_id=1'; // Replace with the actual API endpoint

  Future<List<Landmark>> fetchRecommendedData() async {
    try {
      final response = await _dio.get(_endpoint);
      print('______///////////////${response.statusCode}');
      if (response.statusCode == 200) {
        List<dynamic> data = response.data['landmarks'];
        List<Landmark> recommended =
            data.map((landmark) => Landmark.fromJson(landmark)).toList();
        return recommended;
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception('Failed to load data: $e');
    }
  }
}
