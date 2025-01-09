class CardResponseModel {
  CardResponseModel({
    this.status,
    this.data,
  });

  CardResponseModel.fromJson(dynamic json) {
    status = json['status'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(CardModel.fromJson(v));
      });
    }
  }

  String? status;
  List<CardModel>? data;

  CardResponseModel copyWith({
    String? status,
    List<CardModel>? data,
  }) =>
      CardResponseModel(
        status: status ?? this.status,
        data: data ?? this.data,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class CardModel {
  CardModel({
    this.title,
    this.type,
  });

  CardModel.fromJson(dynamic json) {
    title = json['title'];
    type = json['type'];
  }

  String? title;
  String? type;

  CardModel copyWith({
    String? title,
    String? type,
  }) =>
      CardModel(
        title: title ?? this.title,
        type: type ?? this.type,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = title;
    map['type'] = type;
    return map;
  }
}
