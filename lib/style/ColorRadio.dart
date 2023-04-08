import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'CustomSelector.dart';

class ColorRadio extends StatelessWidget {
  Selector selector;

  ColorRadio(this.selector);

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
        color: Color(selector.color ?? 0xFF3B4257),
        child: Container(
          height: 20,
          width: 54,
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                selector.name ?? '',
                style: TextStyle(
                    color: selector.isSelected ? Colors.white : Colors.grey),
              )
            ],
          ),
        ));
  }
}