import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../network/dio_client.dart';
import '../network/product_api.dart';
import '../repository/product_repo.dart';
import '../route/app_router.dart';

final getIt = GetIt.instance;

Future<void> setup() async {
  getIt.registerSingleton(Dio());
  getIt.registerSingleton(DioClient(getIt<Dio>()));
  getIt.registerSingleton(ProductApi(dioClient: getIt<DioClient>()));
  getIt.registerSingleton(ProductRepository(getIt<ProductApi>()));
  getIt.registerSingleton(AppRouter());
}