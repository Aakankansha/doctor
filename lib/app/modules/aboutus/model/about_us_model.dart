class AboutUsModel {
  final String? id;
  final String? aboutus;
  final num? v;

  AboutUsModel({
    this.id,
    this.aboutus,
    this.v,
  });

  AboutUsModel.fromJson(Map<String, dynamic> json)
    : id = json['_id'] as String?,
      aboutus = json['aboutus'] as String?,
      v = json['__v'] as num?;

  Map<String, dynamic> toJson() => {
    '_id' : id,
    'aboutus' : aboutus,
    '__v' : v
  };
}