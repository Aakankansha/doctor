class UserModel {
  String? id;
  String? mobile;
  String? otp;
  String? isOtpVerified;
  String? userId;
  String? familyRelation;
  String? familyMobile;
  String? name;
  String? email;
  String? gender;
  String? dob;
  String? bloodGroup;
  String? foodType;
  String? height;
  String? weight;
  String? insured;
  String? insuredType;
  String? medicalHistory;
  String? medicalType;
  String? profileImage;
  String? addressId;
  String? area;
  String? latitude;
  String? longitude;
  String? status;
  String? created;

  UserModel(
      {this.id,
      this.mobile,
      this.otp,
      this.isOtpVerified,
      this.userId,
      this.familyRelation,
      this.familyMobile,
      this.name,
      this.email,
      this.gender,
      this.dob,
      this.bloodGroup,
      this.foodType,
      this.height,
      this.weight,
      this.insured,
      this.insuredType,
      this.medicalHistory,
      this.medicalType,
      this.profileImage,
      this.addressId,
      this.area,
      this.latitude,
      this.longitude,
      this.status,
      this.created});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    mobile = json['mobile'];
    otp = json['otp'];
    isOtpVerified = json['is_otp_verified'];
    userId = json['user_id'];
    familyRelation = json['family_relation'];
    familyMobile = json['family_mobile'];
    name = json['name'];
    email = json['email'];
    gender = json['gender'];
    dob = json['dob'];
    bloodGroup = json['blood_group'];
    foodType = json['food_type'];
    height = json['height'];
    weight = json['weight'];
    insured = json['insured'];
    insuredType = json['insured_type'];
    medicalHistory = json['medical_history'];
    medicalType = json['medical_type'];
    profileImage = json['profile_image'];
    addressId = json['address_id'];
    area = json['area'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    status = json['status'];
    created = json['created'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['mobile'] = mobile;
    data['otp'] = otp;
    data['is_otp_verified'] = isOtpVerified;
    data['user_id'] = userId;
    data['family_relation'] = familyRelation;
    data['family_mobile'] = familyMobile;
    data['name'] = name;
    data['email'] = email;
    data['gender'] = gender;
    data['dob'] = dob;
    data['blood_group'] = bloodGroup;
    data['food_type'] = foodType;
    data['height'] = height;
    data['weight'] = weight;
    data['insured'] = insured;
    data['insured_type'] = insuredType;
    data['medical_history'] = medicalHistory;
    data['medical_type'] = medicalType;
    data['profile_image'] = profileImage;
    data['address_id'] = addressId;
    data['area'] = area;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['status'] = status;
    data['created'] = created;
    return data;
  }
}
