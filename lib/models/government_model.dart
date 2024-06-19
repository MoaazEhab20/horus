class City {
  final int id;
  final String cityImg;
  final String cityName;
  final String cityCover;

  City({
    required this.id,
    required this.cityImg,
    required this.cityName,
    required this.cityCover,
  });

  factory City.fromJson(Map<String, dynamic> json) {
    return City(
      id: json['id'],
      cityImg: json['city_img'],
      cityName: json['city_name'],
      cityCover: json['city_cover'],
    );
  }
}
