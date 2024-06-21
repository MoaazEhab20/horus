import 'package:dio/dio.dart';
import '../models/reservation_model.dart';

class ReservationService {
  final Dio _dio = Dio();

  Future<List<Reservation>> fetchReservations() async {
    try {
      final response = await _dio.get(
          'https://hoorus.online/api/reservation_request_for_tour_guide/1');
      if (response.statusCode == 200) {
        List<dynamic> data = response.data['reservations'];
        List<Reservation> reservations = data
            .map((reservations) => Reservation.fromJson(reservations))
            .toList();
        return reservations;
      } else {
        throw Exception('Failed to load reservations');
      }
    } catch (e) {
      throw Exception('Failed to load reservations: $e');
    }
  }
}
