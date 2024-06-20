class Hotel {
  final int id;
  final String name;
  final String description;
  final double rating;
  final String location;
  final String region;
  final int cityId;
  final List<Images> images;
  final List<Booking> bookings;

  Hotel({
    required this.id,
    required this.name,
    required this.description,
    required this.rating,
    required this.location,
    required this.region,
    required this.cityId,
    required this.images,
    required this.bookings,
  });

  factory Hotel.fromJson(Map<String, dynamic> json) {
    var imagesFromJson = json['images'] as List;
    List<Images> imageList = imagesFromJson.map((i) => Images.fromJson(i)).toList();

    var bookingsFromJson = json['bookings'] as List;
    List<Booking> bookingList = bookingsFromJson.map((i) => Booking.fromJson(i)).toList();

    return Hotel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      rating: json['rating'],
      location: json['location'],
      region: json['region'],
      cityId: json['city_id'],
      images: imageList,
      bookings: bookingList,
    );
  }
}

class Images {
  final int id;
  final String img;
  final int hotelId;

  Images({
    required this.id,
    required this.img,
    required this.hotelId,
  });

  factory Images.fromJson(Map<String, dynamic> json) {
    return Images(
      id: json['id'],
      img: json['img'],
      hotelId: json['Hotel_id'],
    );
  }
}

class Booking {
  final int id;
  final String bookingLink;
  final int hotelId;
  final int bookingImgId;
  final String bookingImage;

  Booking({
    required this.id,
    required this.bookingLink,
    required this.hotelId,
    required this.bookingImgId,
    required this.bookingImage,
  });

  factory Booking.fromJson(Map<String, dynamic> json) {
    return Booking(
      id: json['id'],
      bookingLink: json['booking_link'],
      hotelId: json['hotel_id'],
      bookingImgId: json['booking_img_id'],
      bookingImage: json['booking_image'],
    );
  }
}
