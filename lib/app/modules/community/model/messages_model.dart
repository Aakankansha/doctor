class CommunityMessagesModel {
  final String? id;
  final String? communityId;
  final String? sender;
  final String? message;
  final String? createdAt;
  final String? updatedAt;
  final int? v;

  CommunityMessagesModel({
    this.id,
    this.communityId,
    this.sender,
    this.message,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  CommunityMessagesModel.fromJson(Map<String, dynamic> json)
    : id = json['_id'] as String?,
      communityId = json['communityId'] as String?,
      sender = json['sender'] as String?,
      message = json['message'] as String?,
      createdAt = json['createdAt'] as String?,
      updatedAt = json['updatedAt'] as String?,
      v = json['__v'] as int?;

  Map<String, dynamic> toJson() => {
    '_id' : id,
    'communityId' : communityId,
    'sender' : sender,
    'message' : message,
    'createdAt' : createdAt,
    'updatedAt' : updatedAt,
    '__v' : v
  };
}