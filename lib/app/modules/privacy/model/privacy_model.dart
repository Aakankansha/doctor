class PrivacyModel {
  final String? id;
  final String? content;
  final num? v;

  PrivacyModel({
    this.id,
    this.content,
    this.v,
  });

  PrivacyModel.fromJson(Map<String, dynamic> json)
    : id = json['_id'] as String?,
      content = json['content'] as String?,
      v = json['__v'] as num?;

  Map<String, dynamic> toJson() => {
    '_id' : id,
    'content' : content,
    '__v' : v
  };
}