import 'package:flutter_stylish/model/product_content.dart';

class Product {
  final List<ProductContent> data;
  final int next_paging;

  Product(this.data, this.next_paging);
}