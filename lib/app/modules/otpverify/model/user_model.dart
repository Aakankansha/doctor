class OtpUserModel {
  final String? token;
  final User? user;

  OtpUserModel({
    this.token,
    this.user,
  });

  OtpUserModel.fromJson(Map<String, dynamic> json)
      : token = json['token'] as String?,
        user = (json['user'] as Map<String, dynamic>?) != null
            ? User.fromJson(json['user'] as Map<String, dynamic>)
            : null;

  Map<String, dynamic> toJson() => {'token': token, 'user': user?.toJson()};
}

class User {
  final String? id;
  final String? mobile;
  final String? fullName;
  final String? email;
  final String? country;
  final String? city;
  final String? password;
  final String? role;
  final String? educationDetails;
  final String? subject;
  final String? collegeName;
  final String? specialization;
  final num? expectedScore;
  final num? engTestScore;
  final num? aptitudeTestScore;
  final String? profileImage;
  final String? createdAt;
  final String? updatedAt;
  final num? v;

  User({
    this.id,
    this.mobile,
    this.fullName,
    this.email,
    this.country,
    this.city,
    this.password,
    this.role,
    this.educationDetails,
    this.subject,
    this.collegeName,
    this.specialization,
    this.expectedScore,
    this.engTestScore,
    this.aptitudeTestScore,
    this.profileImage,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  User.fromJson(Map<String, dynamic> json)
      : id = json['_id'] as String?,
        mobile = json['mobile'] as String?,
        fullName = json['fullName'] as String?,
        email = json['email'] as String?,
        country = json['country'] as String?,
        city = json['city'] as String?,
        password = json['password'] as String?,
        role = json['role'] as String?,
        educationDetails = json['educationDetails'] as String?,
        subject = json['subject'] as String?,
        collegeName = json['collegeName'] as String?,
        specialization = json['specialization'] as String?,
        expectedScore = json['expectedScore'] as num?,
        engTestScore = json['engTestScore'] as num?,
        aptitudeTestScore = json['aptitudeTestScore'] as num?,
        profileImage = json['profileImage'] as String?,
        createdAt = json['createdAt'] as String?,
        updatedAt = json['updatedAt'] as String?,
        v = json['__v'] as num?;

  Map<String, dynamic> toJson() => {
        '_id': id,
        'mobile': mobile,
        'fullName': fullName,
        'email': email,
        'country': country,
        'city': city,
        'password': password,
        'role': role,
        'educationDetails': educationDetails,
        'subject': subject,
        'collegeName': collegeName,
        'specialization': specialization,
        'expectedScore': expectedScore,
        'engTestScore': engTestScore,
        'aptitudeTestScore': aptitudeTestScore,
        'profileImage': profileImage,
        'createdAt': createdAt,
        'updatedAt': updatedAt,
        '__v': v
      };
}
