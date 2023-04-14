import 'package:flutter/material.dart';
import 'package:flutter_stylish/extension.dart';

import 'custom_selector.dart';

class ColorRadio extends StatelessWidget {
  const ColorRadio({super.key, required this.selector});
  final Selector selector;

  @override
  Widget build(BuildContext context) {
    return Card(
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 2,
            color: selector.isSelected ? Colors.grey.shade800 : Colors.grey.shade200,
          ),
          borderRadius: BorderRadius.all(Radius.circular(50)),
        ),
        margin: EdgeInsets.all(10),
        color: selector.name.toColor(),
        child: Container(
          height: 20,
          width: 52,
          alignment: Alignment.center,  
        ));
  }
}