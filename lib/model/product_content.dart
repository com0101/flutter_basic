import 'dart:convert';

import 'package:flutter_stylish/model/color.dart';
import 'package:flutter_stylish/model/variants.dart';
import 'package:json_annotation/json_annotation.dart';

class ProductContent {
  int? id;
  String? category;
  String? title;
  String? description;
  int? price;
  String? texture;
  String? wash;
  String? place;
  String? note;
  String? story;
  List<Color>? colors;
  List<String>? sizes;
  List<Variants>? variants;
  @JsonKey(name: 'main_image')
  String? mainImage;
  List<String>? images;


  ProductContent(
    this.id, this.category, this.title, this.description,
    this.price, this.texture, this.wash, this.place, this.note,
    this.story, this.colors, this.sizes, this.variants, this.mainImage,
    this.images
  );

  ProductContent.fromJson(Map<String, dynamic> json) {
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
    colors = json['colors'];
    sizes = json['sizes'];
    variants = json['variants'];
    mainImage = json['mainImage'];
    images = json['images'];
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
    colors = data['colors'];
    sizes = data['sizes'];
    variants = data['variants'];
    mainImage = data['mainImage'];
    images = data['images'];
    return data;
  }

}