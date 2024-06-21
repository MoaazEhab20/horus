abstract class ReservationStates {}

class ReservationInitialStates extends ReservationStates {}

class ReservationsSuccessStates extends ReservationStates {}

class ReservationLoadingStates extends ReservationStates {}

class ReservationErrorStates extends ReservationStates {}

class ApprovedReservationsSuccessStates extends ReservationStates {}

class ApprovedReservationsLoadingStates extends ReservationStates {}

class ApprovedReservationErrorStates extends ReservationStates {}