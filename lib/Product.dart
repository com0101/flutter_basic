import 'package:flutter/material.dart';

class Product extends StatelessWidget {
  const Product({
    super.key, required this.name
  });

  final String name;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(name),
    );
  }
}