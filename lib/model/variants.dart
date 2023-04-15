import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class Variants {
  @JsonKey(name: 'color_code')
  String colorCode = 'no data';
  String size = 'no data';
  int stock = 0;

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