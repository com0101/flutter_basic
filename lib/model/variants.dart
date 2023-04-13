import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class Variants {
  @JsonKey(name: 'color_code')
  String? colorCode;
  String? size;
  int? stock;

  Variants(this.colorCode, this.size, this.stock);

  Variants.fromJson(Map<String, dynamic> json) {
    colorCode = json['color_code'];
    size = json['size'];
    stock = json['stock'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    colorCode = data['color_code'];
    size = data['size'];
    stock = data['stock'];
    return data;
  }
}