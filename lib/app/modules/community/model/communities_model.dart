class CommunitesModel {
  final List<RequiredCommunities>? requiredCommunities;

  CommunitesModel({
    this.requiredCommunities,
  });

  CommunitesModel.fromJson(Map<String, dynamic> json)
    : requiredCommunities = (json['requiredCommunities'] as List?)?.map((dynamic e) => RequiredCommunities.fromJson(e as Map<String,dynamic>)).toList();

  Map<String, dynamic> toJson() => {
    'requiredCommunities' : requiredCommunities?.map((e) => e.toJson()).toList()
  };
}

class RequiredCommunities {
  final String? id;
  final String? name;
  final String? userId;
  final List<String>? members;
  final String? createdAt;
  final String? updatedAt;
  final num? v;

  RequiredCommunities({
    this.id,
    this.name,
    this.userId,
    this.members,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  RequiredCommunities.fromJson(Map<String, dynamic> json)
    : id = json['_id'] as String?,
      name = json['name'] as String?,
      userId = json['userId'] as String?,
      members = (json['members'] as List?)?.map((dynamic e) => e as String).toList(),
      createdAt = json['createdAt'] as String?,
      updatedAt = json['updatedAt'] as String?,
      v = json['__v'] as num?;

  Map<String, dynamic> toJson() => {
    '_id' : id,
    'name' : name,
    'userId' : userId,
    'members' : members,
    'createdAt' : createdAt,
    'updatedAt' : updatedAt,
    '__v' : v
  };
}