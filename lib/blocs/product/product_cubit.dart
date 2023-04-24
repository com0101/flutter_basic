import 'package:bloc/bloc.dart';
import 'package:flutter_stylish/blocs/product/product_state.dart';
import 'package:flutter_stylish/repository/product_repo.dart';

import '../../di/service_locator.dart';

class ProductCubit extends Cubit<ProductState> {
  final _productRepository = getIt.get<ProductRepository>();

  ProductCubit() : super(ProductLoadingState()); 
  
  void getWomenProducts() async {
    emit(ProductLoadingState());
    try {
      final products = await _productRepository.getWomenProducts();
      emit(ProductSuccessState(products));
    } catch (e) {
      emit(ProductErrorState(e.toString()));
    }
  }

  void getMenProducts() async {
    emit(ProductLoadingState());
    try {
      final products = await _productRepository.getMenProducts();
      emit(ProductSuccessState(products));
    } catch (e) {
      emit(ProductErrorState(e.toString()));
    }
  }

  void getAccessoriesProducts() async {
    emit(ProductLoadingState());
    try {
      final products = await _productRepository.getAccessoriesProducts();
      emit(ProductSuccessState(products));
    } catch (e) {
      emit(ProductErrorState(e.toString()));
    }
  }

  void getProductById(num id) async {
    emit(ProductLoadingState());
    try {
      final product = await _productRepository.getProductById(id);
      emit(DetailSuccessState(product));
    } catch (e) {
      emit(ProductErrorState(e.toString()));
    }
  }

  void checkoutProduct() async {
    emit(ProductLoadingState());
    try {
      final message = await _productRepository.checkoutProduct();
      emit(PaymentSuccessState(message));
    } catch (e) {
      emit(ProductErrorState(e.toString()));
    }
  }

  @override
  void onChange(Change<ProductState> change) {
    print(change);
    super.onChange(change);
  }
}