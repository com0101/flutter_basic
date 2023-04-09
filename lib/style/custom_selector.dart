import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/product_detail_provider.dart';
import 'color_radio.dart';
import 'size_radio.dart';

class CustomSelector extends StatefulWidget {
  const CustomSelector({
    super.key, required this.items, required this.type
  });

  final List<Selector> items;
  final SelectorType type;
  @override
  _CustomSelector createState() => _CustomSelector();
}

class _CustomSelector extends State<CustomSelector> {

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductDetailProvider>(
        builder: (context, value, child) =>ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: widget.items.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              value.setSelector(selectors: widget.items, index: index, type: widget.type);
            },
            child: widget.type == SelectorType.size ? SizeRadio(widget.items[index]): ColorRadio(widget.items[index]),
          );
        })
    );
  }
}

enum SelectorType { size, color }

class Selector {
  String name;
  bool isSelected;

  Selector(this.name, this.isSelected);
}