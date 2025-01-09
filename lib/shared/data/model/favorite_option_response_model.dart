class FavoriteOptionResponseModel {
  FavoriteOptionResponseModel({
    this.status,
    this.data,
  });

  FavoriteOptionResponseModel.fromJson(dynamic json) {
    status = json['status'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(FavoriteOptionModel.fromJson(v));
      });
    }
  }

  String? status;
  List<FavoriteOptionModel>? data;

  FavoriteOptionResponseModel copyWith({
    String? status,
    List<FavoriteOptionModel>? data,
  }) =>
      FavoriteOptionResponseModel(
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

class FavoriteOptionModel {
  FavoriteOptionModel({
    this.image,
    this.symbol,
    this.text,
  });

  FavoriteOptionModel.fromJson(dynamic json) {
    image = json['image'];
    symbol = json['symbol'];
    text = json['text'];
  }

  String? image;
  String? symbol;
  String? text;

  FavoriteOptionModel copyWith({
    String? image,
    String? symbol,
    String? text,
  }) =>
      FavoriteOptionModel(
        image: image ?? this.image,
        symbol: symbol ?? this.symbol,
        text: text ?? this.text,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['image'] = image;
    map['symbol'] = symbol;
    map['text'] = text;
    return map;
  }
}
