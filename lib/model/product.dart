import 'package:flutter_stylish/model/product_content.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class Product {
  List<ProductContent> data = List.empty();
  @JsonKey(name: 'next_paging')
  int nextPaging = 0;

  Product(this.data, this.nextPaging);

  Product.fromJson(Map<String, dynamic> json) {
    data = json['data'];
    nextPaging = json['next_paging'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> productData = <String, dynamic>{};
    productData['data'] = data;
    productData['next_paging'] = nextPaging;
    return productData;
  }
}