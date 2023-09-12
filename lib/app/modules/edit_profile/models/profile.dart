class ProfileModel {
  String? id;
  String? mobile;
  String? otp;
  String? isOtpVerified;
  String? name;
  String? email;
  String? gender;
  String? dob;
  String? insured;
  String? profileImage;
  String? status;
  String? created;

  ProfileModel(
      {this.id,
      this.mobile,
      this.otp,
      this.isOtpVerified,
      this.name,
      this.email,
      this.gender,
      this.dob,
      this.insured,
      this.profileImage,
      this.status,
      this.created});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    mobile = json['mobile'];
    otp = json['otp'];
    isOtpVerified = json['is_otp_verified'];
    name = json['name'];
    email = json['email'];
    gender = json['gender'];
    dob = json['dob'];
    insured = json['insured'];
    profileImage = json['profile_image'];
    status = json['status'];
    created = json['created'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['mobile'] = mobile;
    data['otp'] = otp;
    data['is_otp_verified'] = isOtpVerified;
    data['name'] = name;
    data['email'] = email;
    data['gender'] = gender;
    data['dob'] = dob;
    data['insured'] = insured;
    data['profile_image'] = profileImage;
    data['status'] = status;
    data['created'] = created;
    return data;
  }
}
