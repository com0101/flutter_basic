import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: widget.items.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              setState(() {
                for (var item in widget.items) {
                  item.isSelected = false;
                }
                widget.items[index].isSelected = true;
              });
            },
            child: widget.type == SelectorType.size ? SizeRadio(widget.items[index]): ColorRadio(widget.items[index]),
          );
        });
  }
}

enum SelectorType { size, color }

class Selector {
  String? name;
  int? color;
  bool isSelected;

  Selector(this.name, this.color, this.isSelected);
}