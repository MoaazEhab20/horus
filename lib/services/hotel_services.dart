import 'package:dio/dio.dart';

import '../main.dart';
import '../models/hotel_model.dart';

class HotelService {
  final Dio _dio = Dio();

  Future<List<Hotel>> fetchHotels() async {
    try {
      final response = await _dio
          .get('https://hoorus.online/api/read_hotel?city_id=$indexCity');
      if (response.statusCode == 200) {
        List<dynamic> data = response.data['hotels'];
        List<Hotel> hotels =
            data.map((hotel) => Hotel.fromJson(hotel)).toList();
        return hotels;
      } else {
        throw Exception('Failed to load hotels');
      }
    } catch (e) {
      throw Exception('Failed to load hotels: $e');
    }
  }
}
