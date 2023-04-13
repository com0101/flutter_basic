import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class Color {
  String? code;
  String? name;
  
  Color(this.code, this.name);

  Color.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    code = data['code'];
    name = data['name'];
    return data;
  }
}