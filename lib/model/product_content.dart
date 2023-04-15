import 'package:flutter_stylish/model/color.dart';
import 'package:flutter_stylish/model/variants.dart';
import 'package:json_annotation/json_annotation.dart';

class ProductContent {
  int id = 0;
  String category = 'no data';
  String title = 'no data';
  String description = 'no data';
  int price = 0;
  String texture = 'no data';
  String wash = 'no data';
  String place = 'no data';
  String note = 'no data';
  String story = 'no data';
  List<Color> colors = List.empty();
  List<String> sizes = List.empty();
  List<Variants> variants = List.empty();
  @JsonKey(name: 'main_image')
  String mainImage = 'no data';
  List<String> images = List.empty();


  ProductContent(
    this.id, this.category, this.title, this.description,
    this.price, this.texture, this.wash, this.place, this.note,
    this.story, this.colors, this.sizes, this.variants, this.mainImage,
    this.images
  );

  ProductContent.fromJson(Map<String, dynamic> json) {
    final List<Color> colorList = (json['colors'] as List).map((e) => Color.fromJson(e)).toList();
    final List<Variants> variantsList = (json['variants'] as List).map((e) => Variants.fromJson(e)).toList();

    id = json['id'];
    category = json['category'];
    title = json['title'];
    description = json['description'];
    price = json['price'];
    texture = json['texture'];
    wash = json['wash'];
    place = json['place'];
    note = json['note'];
    story = json['story'];
    colors = colorList;
    sizes = json['sizes'].cast<String>();
    variants = variantsList;
    mainImage = json['main_image'];
    images = json['images'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    id = data['id'];
    category = data['category'];
    title = data['title'];
    description = data['description'];
    price = data['price'];
    texture = data['texture'];
    wash = data['wash'];
    place = data['place'];
    note = data['note'];
    story = data['story'];
   colors = data['colors'].cast<Color>();
    sizes = data['sizes'].cast<String>();
    variants = data['variants'].cast<Variants>();
    mainImage = data['main_image'];
    images = data['images'].cast<String>();
    return data;
  }

}