import 'package:bloc/bloc.dart';
import 'package:flutter_stylish/blocs/product/product_event.dart';
import 'package:flutter_stylish/blocs/product/product_state.dart';

import '../../repository/product_repo.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository _productRepository;

  ProductBloc(this._productRepository) : super(ProductLoadingState()) {
    on<LoadProductEvent>((event, emit) async {
      emit(ProductLoadingState());
      try {
        final products = await _productRepository.getWomenProducts();
        emit(ProductSuccessState(products));
      } catch (e) {
        emit(ProductErrorState(e.toString()));
      }
    });
  }
  // most example is writing like this
  
  // ProductBloc(super.initialState, this._productRepository);

  // ProductState get initialState => ProductLoadingState();

  // Stream<ProductState> mapEventToState(ProductEvent event) async* {
  //   if (event is LoadProductEvent) {
  //     yield ProductLoadingState();
  //     try {
  //       final products = await _productRepository.getProduct();
  //       yield ProductSuccessState(products);
  //     } catch (e) {
  //       yield ProductErrorState(e.toString());
  //     }
  //   }
  // }

}