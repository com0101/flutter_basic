import 'package:dio/dio.dart';

import 'dio_client.dart';
import 'endpoint.dart';

class ProductApi {
  final DioClient dioClient;
  
  ProductApi({required this.dioClient});

  Future<Response> getWomenProducts() async {
    try {
      final Response response = await dioClient.get(
        Endpoint.productWomen,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> getMenProducts() async {
    try {
      final Response response = await dioClient.get(
        Endpoint.productMen,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> getAccessoriesProducts() async {
    try {
      final Response response = await dioClient.get(
        Endpoint.productAccessories,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

   Future<Response> getProductById(num id) async {
    try {
      final Response response = await dioClient.get(
        Endpoint.productDetail,
        queryParameters: {"id": id},
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}