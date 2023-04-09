import 'package:bloc/bloc.dart';
import 'package:flutter_stylish/blocs/product_event.dart';
import 'package:flutter_stylish/blocs/product_state.dart';

import '../repository/product_repo.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository _productRepository;

  ProductBloc(this._productRepository) : super(ProductLoadingState()) {
    on<LoadProductEvent>((event, emit) async {
      emit(ProductLoadingState());
      await Future.delayed(Duration(seconds: 2));
      try {
        final users = await _productRepository.getProduct();
        emit(ProductSuccessState(users));
      } catch (e) {
        emit(ProductErrorState(e.toString()));
      }
    });
  }
}