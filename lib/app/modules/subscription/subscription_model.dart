class SubscriptionModel {
  String? sId;
  String? title;
  String? validity;
  int? amount;
  String? type;
  List<Description>? description;
  bool? isActive;
  String? requestStatus;

  SubscriptionModel(
      {this.sId,
      this.title,
      this.validity,
      this.amount,
      this.type,
      this.description,
      this.isActive,
      this.requestStatus});

  SubscriptionModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    validity = json['validity'];
    amount = json['amount'];
    type = json['type'];
    if (json['description'] != null) {
      description = <Description>[];
      json['description'].forEach((v) {
        description!.add(Description.fromJson(v));
      });
    }
    isActive = json['isActive'];
    requestStatus = json['requestStatus'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['title'] = title;
    data['validity'] = validity;
    data['amount'] = amount;
    data['type'] = type;
    if (description != null) {
      data['description'] = description!.map((v) => v.toJson()).toList();
    }
    data['isActive'] = isActive;
    data['requestStatus'] = requestStatus;
    return data;
  }
}

class Description {
  String? info1;
  String? info2;

  Description({this.info1, this.info2});

  Description.fromJson(Map<String, dynamic> json) {
    info1 = json['info1'];
    info2 = json['info2'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['info1'] = info1;
    data['info2'] = info2;
    return data;
  }
}
