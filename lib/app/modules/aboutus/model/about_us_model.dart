class AboutUsModel {
  String? id;
  String? aboutContent;
  String? mobileNo;
  String? email;
  String? status;
  String? created;

  AboutUsModel(
      {this.id,
      this.aboutContent,
      this.mobileNo,
      this.email,
      this.status,
      this.created});

  AboutUsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    aboutContent = json['about_content'];
    mobileNo = json['mobile_no'];
    email = json['email'];
    status = json['status'];
    created = json['created'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['about_content'] = aboutContent;
    data['mobile_no'] = mobileNo;
    data['email'] = email;
    data['status'] = status;
    data['created'] = created;
    return data;
  }
}
