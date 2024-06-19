import 'package:dio/dio.dart';

import '../models/government_model.dart';

class CityService {
  final Dio _dio = Dio();

  Future<List<City>> fetchCities() async {
    try {
      final response = await _dio.get('https://hoorus.online/api/read_city');
      if (response.statusCode == 200) {
        List<dynamic> data = response.data['cities'];
        List<City> cities = data.map((city) => City.fromJson(city)).toList();
        return cities;
      } else {
        throw Exception('Failed to load cities');
      }
    } catch (e) {
      throw Exception('Failed to load cities: $e');
    }
  }
}
