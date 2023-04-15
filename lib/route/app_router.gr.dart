// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i4;
import 'package:flutter_stylish/model/product_content.dart' as _i5;
import 'package:flutter_stylish/view/detail/product_detail_view.dart' as _i2;
import 'package:flutter_stylish/view/home/home.dart' as _i1;

class AppRouter extends _i3.RootStackRouter {
  AppRouter([_i4.GlobalKey<_i4.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    HomeRouter.name: (routeData) {
      return _i3.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i1.Home(),
      );
    },
    ProductDetailRouter.name: (routeData) {
      final args = routeData.argsAs<ProductDetailRouterArgs>();
      return _i3.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i2.ProductDetailView(
          key: args.key,
          productId: args.productId,
          productContent: args.productContent,
        ),
      );
    },
  };

  @override
  List<_i3.RouteConfig> get routes => [
        _i3.RouteConfig(
          '/#redirect',
          path: '/',
          redirectTo: '/home',
          fullMatch: true,
        ),
        _i3.RouteConfig(
          HomeRouter.name,
          path: '/home',
        ),
        _i3.RouteConfig(
          ProductDetailRouter.name,
          path: '/product/:productId',
        ),
      ];
}

/// generated route for
/// [_i1.Home]
class HomeRouter extends _i3.PageRouteInfo<void> {
  const HomeRouter()
      : super(
          HomeRouter.name,
          path: '/home',
        );

  static const String name = 'HomeRouter';
}

/// generated route for
/// [_i2.ProductDetailView]
class ProductDetailRouter extends _i3.PageRouteInfo<ProductDetailRouterArgs> {
  ProductDetailRouter({
    _i4.Key? key,
    required int productId,
    required _i5.ProductContent productContent,
  }) : super(
          ProductDetailRouter.name,
          path: '/product/:productId',
          args: ProductDetailRouterArgs(
            key: key,
            productId: productId,
            productContent: productContent,
          ),
          rawPathParams: {'productId': productId},
        );

  static const String name = 'ProductDetailRouter';
}

class ProductDetailRouterArgs {
  const ProductDetailRouterArgs({
    this.key,
    required this.productId,
    required this.productContent,
  });

  final _i4.Key? key;

  final int productId;

  final _i5.ProductContent productContent;

  @override
  String toString() {
    return 'ProductDetailRouterArgs{key: $key, productId: $productId, productContent: $productContent}';
  }
}
