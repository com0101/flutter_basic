import 'package:dio/dio.dart';
import 'package:flutter_stylish/model/product_content.dart';
import 'package:flutter_stylish/model/variants.dart';
import 'package:flutter_stylish/network/product_api.dart';

import '../model/color.dart';
import '../network/dio_exceptions.dart';

class ProductRepository {
  final ProductApi productApi;

  ProductRepository(this.productApi);

  Future<List<ProductContent>> getWomenProducts() async {
    try {
      final response = await productApi.getWomenProducts();
      final products = (response.data['data'] as List)
          .map((e) => ProductContent.fromJson(e))
          .toList();
      return products;
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }

  Future<List<ProductContent>> getMenProducts() async {
    try {
      final response = await productApi.getMenProducts();
      final products = (response.data['data'] as List)
          .map((e) => ProductContent.fromJson(e))
          .toList();
      return products;
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }

  Future<List<ProductContent>> getAccessoriesProducts() async {
    try {
      final response = await productApi.getAccessoriesProducts();
      final products = (response.data['data'] as List)
          .map((e) => ProductContent.fromJson(e))
          .toList();
      return products;
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }

  Future<List<ProductContent>> getProduct() {
    List<ProductContent> products = List.empty();
    for(var item =0; item < 15; item++) {
      ProductContent(
        item,
        "men",
        "厚實毛呢格子外套",
        "高抗寒素材選用，保暖也時尚有型",
        2200,
        "棉、聚脂纖維",
        "手洗（水溫40度)",
        "韓國",
        "實品顏色以單品照為主",
        "你絕對不能錯過的超值商品",
        <Color>[Color("334455", "深藍"), Color("FFFFFF", "白色"), Color("00CACA", "青色")],
        <String>["S", "M", "L"],
        <Variants>[Variants("334455", "s", 5), Variants("334455", "M", 10), Variants("FFFFFF", "s", 8)],
        "assets/images/cloth_1.jpg",
        ["assets/images/cloth_1.jpg", "assets/images/cloth_1.jpg", "assets/images/cloth_1.jpg"],
      );
    }
    return Future.value(products);
  }

}