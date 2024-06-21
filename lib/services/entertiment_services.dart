import 'package:dio/dio.dart';

import '../models/landmark_model.dart';

class EntertimentService {
  final Dio _dio = Dio();
  final String _endpoint =
      'https://hoorus.online/api/read_landmark_type?city_id=2&tourism_type=Entertainment'; // Replace with the actual API endpoint

  Future<List<Landmark>> fetchEntertimentData() async {
    try {
      final response = await _dio.get(_endpoint);
      print('______///////////////${response.statusCode}');
      if (response.statusCode == 200) {
        List<dynamic> data = response.data['landmarks'];
        List<Landmark> landmarks =
            data.map((landmark) => Landmark.fromJson(landmark)).toList();
        return landmarks;
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception('Failed to load data: $e');
    }
  }
}
