class TourGuide {
  final int id;
  final String name;
  final String email;
  final int gender;
  final String nationality;
  final String phoneNumber;
  final String profilePic;
  final String ssn;
  final int emailType;
  final bool isBlocked;
  final bool isApproved;
  final double? rate;
  final int price;
  final int cityId;
  final List<Language> languages;

  TourGuide({
    required this.id,
    required this.name,
    required this.email,
    required this.gender,
    required this.nationality,
    required this.phoneNumber,
    required this.profilePic,
    required this.ssn,
    required this.emailType,
    required this.isBlocked,
    required this.isApproved,
    required this.rate,
    required this.price,
    required this.cityId,
    required this.languages,
  });

  factory TourGuide.fromJson(Map<String, dynamic> json) {
    var languagesFromJson = json['languages'] as List;
    List<Language> languageList =
        languagesFromJson.map((i) => Language.fromJson(i)).toList();

    return TourGuide(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      gender: json['gender'],
      nationality: json['nationality'],
      phoneNumber: json['phone_number'],
      profilePic: json['profile_pic'],
      ssn: json['ssn'],
      emailType: json['email_type'],
      isBlocked: json['isBlocked'] == 1,
      isApproved: json['isApproved'] == 1,
      rate: json['rate'] != null ? json['rate'].toDouble() : null,
      price: json['price'],
      cityId: json['city_id'],
      languages: languageList,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'gender': gender,
      'nationality': nationality,
      'phone_number': phoneNumber,
      'profile_pic': profilePic,
      'ssn': ssn,
      'email_type': emailType,
      'isBlocked': isBlocked ? 1 : 0,
      'isApproved': isApproved ? 1 : 0,
      'rate': rate,
      'price': price,
      'city_id': cityId,
      'languages': languages.map((language) => language.toJson()).toList(),
    };
  }
}

class Language {
  final int id;
  final String name;

  Language({
    required this.id,
    required this.name,
  });

  factory Language.fromJson(Map<String, dynamic> json) {
    return Language(
      id: json['id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}
