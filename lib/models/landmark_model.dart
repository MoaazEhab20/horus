class Landmark {
  final String name;
  final String description;
  final double rating;
  final String location;
  final String sundayOpen;
  final String sundayClose;
  final String mondayOpen;
  final String mondayClose;
  final String tuesdayOpen;
  final String tuesdayClose;
  final String wednesdayOpen;
  final String wednesdayClose;
  final String thursdayOpen;
  final String thursdayClose;
  final String fridayOpen;
  final String fridayClose;
  final String saturdayOpen;
  final String saturdayClose;
  final String? booking;
  final double egyptianTicket;
  final double egyptianStudentTicket;
  final double foreignTicket;
  final double foreignStudentTicket;
  final String region;
  final List<Images> images;

  Landmark({
    required this.name,
    required this.description,
    required this.rating,
    required this.location,
    required this.sundayOpen,
    required this.sundayClose,
    required this.mondayOpen,
    required this.mondayClose,
    required this.tuesdayOpen,
    required this.tuesdayClose,
    required this.wednesdayOpen,
    required this.wednesdayClose,
    required this.thursdayOpen,
    required this.thursdayClose,
    required this.fridayOpen,
    required this.fridayClose,
    required this.saturdayOpen,
    required this.saturdayClose,
    required this.egyptianTicket,
    required this.egyptianStudentTicket,
    required this.foreignTicket,
    required this.foreignStudentTicket,
    required this.region,
    required this.images,
    required this.booking,
  });

  factory Landmark.fromJson(Map<String, dynamic> json) {
    var imagesFromJson = json['images'] as List;
    List<Images> imageList =
        imagesFromJson.map((i) => Images.fromJson(i)).toList();
    return Landmark(
      name: json['name'],
      description: json['description'],
      rating: json['rating'].toDouble(),
      location: json['location'],
      sundayOpen: json['sunday_open'],
      sundayClose: json['sunday_close'],
      mondayOpen: json['monday_open'],
      mondayClose: json['monday_close'],
      tuesdayOpen: json['tuesday_open'],
      tuesdayClose: json['tuesday_close'],
      wednesdayOpen: json['wednesday_open'],
      wednesdayClose: json['wednesday_close'],
      thursdayOpen: json['thursday_open'],
      thursdayClose: json['thursday_close'],
      fridayOpen: json['friday_open'],
      fridayClose: json['friday_close'],
      saturdayOpen: json['saturday_open'],
      saturdayClose: json['saturday_close'],
      egyptianTicket: json['egyptian_ticket'].toDouble(),
      egyptianStudentTicket: json['egyptian_student_ticket'].toDouble(),
      foreignTicket: json['foreign_ticket'].toDouble(),
      foreignStudentTicket: json['foreign_student_ticket'].toDouble(),
      region: json['region'],
      images: imageList,
      booking: json['booking'],
    );
  }
}

class Images {
  final int id;
  final String img;
  final int landmarkId;

  Images({
    required this.id,
    required this.img,
    required this.landmarkId,
  });

  factory Images.fromJson(Map<String, dynamic> json) {
    return Images(
      id: json['id'],
      img: json['img'],
      landmarkId: json['landmark_id'],
    );
  }
}
