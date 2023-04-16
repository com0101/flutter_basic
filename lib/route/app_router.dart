import 'package:flutter_stylish/model/product_content.dart';
import 'package:flutter_stylish/view/detail/product_detail_view.dart';
import 'package:go_router/go_router.dart';

import '../view/home/home.dart';

class AppRouter {
  final GoRouter route = GoRouter(
    routes: [
      GoRoute(
        name: 'home',
        path: "/",
        builder: (context, state) => const Home(),
      ),
      GoRoute(
        name: 'product',
        path: "/product/:productId",
        builder: (context, state) => ProductDetailView(
          productContent: state.extra as ProductContent,
          productId: state.params["productId"]!,
        ),
      )
    ],
  );
}