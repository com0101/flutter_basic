import 'package:dio/dio.dart';
import 'package:flutter_stylish/model/product_content.dart';
import 'package:flutter_stylish/network/product_api.dart';
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

  Future<ProductContent> getProductById(num id) async {
    try {
      final response = await productApi.getProductById(id);
      final product = (response.data['data'])
          .map((e) => ProductContent.fromJson(e));
      return product;
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }
}