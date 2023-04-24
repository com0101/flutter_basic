
import 'package:bloc/bloc.dart';
import 'package:flutter_stylish/blocs/battery/battery_state.dart';
import 'package:flutter_stylish/repository/product_repo.dart';

import '../../di/service_locator.dart';

class BatteryCubit extends Cubit<BatteryState> {

  final _productRepository = getIt.get<ProductRepository>();
  BatteryCubit() : super(BatteryLoadingState()); 
  
  void getBatteryLevel() async {
    try {
      final product = await _productRepository.getBatteryLevel();
      emit(BatterySuccessState(product));
    } catch (e) {
      emit(BatteryErrorState(e.toString()));
    }
  }
}