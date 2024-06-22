import 'package:dio/dio.dart';
import '../main.dart';
import '../models/tourguide_model.dart';

class TourGuideService {
  final Dio _dio = Dio();

  Future<List<TourGuide>> fetchTourGuides() async {
    try {
      final response = await _dio
          .get('https://hoorus.online/api/tourguides/city/$indexCity');
      if (response.statusCode == 200) {
        List<dynamic> data = response.data['tourGuides'];
        List<TourGuide> tourGuides =
            data.map((tourGuide) => TourGuide.fromJson(tourGuide)).toList();
        return tourGuides;
      } else {
        throw Exception('Failed to load tourGuides');
      }
    } catch (e) {
      throw Exception('Failed to load tourGuides: $e');
    }
  }
}
