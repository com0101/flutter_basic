import 'dart:ffi';

import 'package:flutter_stylish/data/color.dart';
import 'package:flutter_stylish/data/variants.dart';

class ProductContent {
  final Long id;
  final String category;
  final String title;
  final String description;
  final int price;
  final String texture;
  final String wash;
  final String place;
  final String note;
  final String story;
  final List<Color> colors;
  final List<String> sizes;
  final List<Variants> variants;
  final String main_image;
  final List<String> images;


  ProductContent(
    this.id, this.category, this.title, this.description,
    this.price, this.texture, this.wash, this.place, this.note,
    this.story, this.colors, this.sizes, this.variants, this.main_image,
    this.images
  );
}