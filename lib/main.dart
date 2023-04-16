import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_stylish/blocs/product_cubit.dart';
import 'package:flutter_stylish/di/service_locator.dart';
import 'package:flutter_stylish/route/app_router.dart';
import 'package:go_router/go_router.dart';

void main() {
  GoRouter.setUrlPathStrategy(UrlPathStrategy.path); // remove #
  setup();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  
  @override
  State<StatefulWidget> createState() => _MyApp();
}

class _MyApp extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    final appRouter = getIt<AppRouter>();
    return BlocProvider<ProductCubit>(
      create: (BuildContext context) => ProductCubit(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.grey,
        ),
        home: MaterialApp.router( 
          routerDelegate: appRouter.route.routerDelegate,
          routeInformationParser: appRouter.route.routeInformationParser
        ),
      ),
    );
  }
}