import 'package:auto_route/annotations.dart';
import 'package:flutter_stylish/view/detail/product_detail_view.dart';

import '../view/home/home.dart';

@AdaptiveAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(
      name: 'HomeRouter',
      page: Home, 
      path: '/home',
      initial: true
    ),
    AutoRoute(
      name: 'ProductDetailRouter',
      page: ProductDetailView,
      path: '/product/:productId',
    ),
  ],
)
class $AppRouter {}