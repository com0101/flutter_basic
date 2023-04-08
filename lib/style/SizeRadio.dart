import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'CustomSelector.dart';

class SizeRadio extends StatelessWidget {
  Selector selector;

  SizeRadio(this.selector);

  @override
  Widget build(BuildContext context) {
    return Card(
        shape:const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(50)),
        ),
        margin: EdgeInsets.all(10),
        color: selector.isSelected ? Colors.grey.shade800 : Colors.white,
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