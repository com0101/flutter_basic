import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_stylish/blocs/product_bloc.dart';
import 'package:flutter_stylish/blocs/product_cubit.dart';
import 'package:flutter_stylish/di/service_locator.dart';
import 'package:flutter_stylish/repository/product_repo.dart';
import 'package:flutter_stylish/view/detail/product_detail_view.dart';
import 'package:flutter_stylish/view/home/home.dart';

void main() {
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
    return BlocProvider<ProductCubit>(
      create: (BuildContext context) => ProductCubit(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.grey,
        ),
        home: LayoutBuilder(builder: (context, constraints) {
          return MaterialApp( 
            initialRoute: '/home',
            routes: {
              '/home':(context) =>  Home(), 
              '/productDetail': (context) => ProductDetailView()
            }
          );
        }),
      ),
    );
  }
}