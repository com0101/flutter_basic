import 'package:flutter/material.dart';

import '../model/variants.dart';
import '../style/custom_selector.dart';

class ProductDetailProvider extends ChangeNotifier {

  List<Selector> _sizeSelector = List.empty();
  List<Selector> get sizeSelector => _sizeSelector;

  List<Selector> _colorSelector = List.empty();
  List<Selector> get colorSelector => _colorSelector;

  List<Variants> _sizeVariants = List.empty();
  List<Variants> get sizeVariants => _sizeVariants;
  
  int _stock = 0;
  int get stock => _stock;

  void getColorList() {
    List<String> colors = ['334455', 'FFFFFF', '00CACA'];
    _colorSelector = colors.map((e) => Selector(e, false)).toList();
    notifyListeners();
  }

  void getSizeList() {
    List<String> sizes = ['S', 'M', 'L'];
    _sizeSelector = sizes.map((e) => Selector(e, false)).toList();
    notifyListeners();
  }

  void setSelector({required List<Selector> selectors, required int index, required SelectorType type}) {
    for(var item in selectors) {
      item.isSelected = false;
    }
    selectors[index].isSelected = true;
    if(type == SelectorType.color) {
      _colorSelector = selectors;
    } else {
      _sizeSelector = selectors;
    }
    notifyListeners();
  }

  void getSize({required List<Variants> variants, required String color}) {
    _sizeVariants = variants.where((variant) => variant.colorCode == color).toList();
    notifyListeners();
  }
}