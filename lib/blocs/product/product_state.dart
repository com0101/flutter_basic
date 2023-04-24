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

class DetailSuccessState extends ProductState {
  final ProductContent product;
  DetailSuccessState(this.product);
  @override
  List<Object?> get props => [product];
}

class PaymentSuccessState extends ProductState {
  final String message;
  PaymentSuccessState(this.message);
  @override
  List<Object?> get props => [message];
}

class ProductErrorState extends ProductState {
  final String error;
  ProductErrorState(this.error);
  @override
  List<Object?> get props => [error];
}