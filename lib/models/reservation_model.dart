class Reservation {
  final int id;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int touristId;
  final int tourguideId;
  final int landmarkId;
  final int hours;
  final int priceOfHour;
  final bool isAccepted;
  final bool isFinished;
  final String startingTime;
  final String finishedTime;
  final DateTime day;
  final SimpleTourist tourist;
  final Landmark landmark;

  Reservation({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.touristId,
    required this.tourguideId,
    required this.landmarkId,
    required this.hours,
    required this.priceOfHour,
    required this.isAccepted,
    required this.isFinished,
    required this.startingTime,
    required this.finishedTime,
    required this.day,
    required this.tourist,
    required this.landmark,
  });

  factory Reservation.fromJson(Map<String, dynamic> json) {
    return Reservation(
      id: json['id'] ?? 0,
      createdAt:
          DateTime.parse(json['created_at'] ?? DateTime.now().toString()),
      updatedAt:
          DateTime.parse(json['updated_at'] ?? DateTime.now().toString()),
      touristId: json['tourist_id'] ?? 0,
      tourguideId: json['tourguide_id'] ?? 0,
      landmarkId: json['landmark_id'] ?? 0,
      hours: json['hours'] ?? 0,
      priceOfHour: json['price_of_hour'] ?? 0,
      isAccepted: json['isAccepted'] == 1,
      isFinished: json['isFinished'] == 1,
      startingTime: json['starting_time'] ?? '',
      finishedTime: json['finished_time'] ?? '',
      day: DateTime.parse(json['day'] ?? DateTime.now().toString()),
      tourist: SimpleTourist.fromJson(json['tourist'] ?? {}),
      landmark: Landmark.fromJson(json['landmark'] ?? {}),
    );
  }
}

class SimpleTourist {
  final int id;
  final String name;
  final String? profilePic;

  SimpleTourist({
    required this.id,
    required this.name,
    this.profilePic,
  });

  factory SimpleTourist.fromJson(Map<String, dynamic> json) {
    return SimpleTourist(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      profilePic: json['profile_pic'],
    );
  }
}

class Landmark {
  final int id;
  final String name;

  Landmark({
    required this.id,
    required this.name,
  });

  factory Landmark.fromJson(Map<String, dynamic> json) {
    return Landmark(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
    );
  }
}
