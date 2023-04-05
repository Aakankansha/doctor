class OtpModel {
  final String? otp;
  final OtpToSend? otpToSend;

  OtpModel({
    this.otp,
    this.otpToSend,
  });

  OtpModel.fromJson(Map<String, dynamic> json)
    : otp = json['otp'] as String?,
      otpToSend = (json['otpToSend'] as Map<String,dynamic>?) != null ? OtpToSend.fromJson(json['otpToSend'] as Map<String,dynamic>) : null;

  Map<String, dynamic> toJson() => {
    'otp' : otp,
    'otpToSend' : otpToSend?.toJson()
  };
}

class OtpToSend {
  final String? otp;
  final String? mobile;
  final String? role;
  final String? id;
  final String? createdAt;
  final num? v;

  OtpToSend({
    this.otp,
    this.mobile,
    this.role,
    this.id,
    this.createdAt,
    this.v,
  });

  OtpToSend.fromJson(Map<String, dynamic> json)
    : otp = json['otp'] as String?,
      mobile = json['mobile'] as String?,
      role = json['role'] as String?,
      id = json['_id'] as String?,
      createdAt = json['createdAt'] as String?,
      v = json['__v'] as num?;

  Map<String, dynamic> toJson() => {
    'otp' : otp,
    'mobile' : mobile,
    'role' : role,
    '_id' : id,
    'createdAt' : createdAt,
    '__v' : v
  };
}