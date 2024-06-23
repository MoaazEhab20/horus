import 'package:final_project/core/utils/api_service.dart';
import 'package:final_project/cubit/reservation/reservation_states.dart';
import 'package:final_project/models/reservation_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../services/api_service.dart';

class ReservationCubit extends Cubit<ReservationStates> {
  ReservationCubit() : super(ReservationInitialStates());
  static ReservationCubit get(context) => BlocProvider.of(context);

  late Reservation reservation;
//////////////////////////////////////////////////
  void createReservations({
    required String tourist_id,
    required String tourguide_id,
    required String landmark_id,
    required String hours,
    required String starting_time,
    required String finished_time,
    required String day,
  }) {
    emit(ReservationLoadingStates());
    DioHelper.postData(
      url: 'https://hoorus.online/api/reservations',
      data: {
        'tourist_id': tourist_id,
        'tourguide_id': tourguide_id,
        'landmark_id': landmark_id,
        'hours': hours,
        'starting_time': starting_time,
        'finished_time': finished_time,
        'day': day,
      },
    ).then((value) {
      reservation = Reservation.fromJson(value.data);
      emit(ReservationsSuccessStates());
    }).catchError((error) {
      print(error);
      emit(ReservationErrorStates());
    });
  }

  void approvedReservations({
    required String reservation_id,
    required String isAccepted,
  }) {
    emit(ApprovedReservationsLoadingStates());
    DioHelper.postData(
      url: 'https://hoorus.online/api/approval_reservation',
      data: {
        'id': reservation_id,
        'isAccepted': isAccepted,
      },
    ).then((value) {
      reservation = Reservation.fromJson(value.data);
      emit(ApprovedReservationsSuccessStates());
    }).catchError((error) {
      print(error);
      emit(ApprovedReservationErrorStates());
    });
  }
}
