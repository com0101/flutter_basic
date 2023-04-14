import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_stylish/model/product_content.dart';

@immutable
abstract class ProductState extends Equatable {}

class ProductLoadingState extends ProductState {
  @override
  List<Object?> get props => [];
}

class ProductSuccessState extends ProductState {
  final List<ProductContent> products;
  ProductSuccessState(this.products);
  @override
  List<Object?> get props => [products];
}

class ProductErrorState extends ProductState {
  final String error;
  ProductErrorState(this.error);
  @override
  List<Object?> get props => [error];
}