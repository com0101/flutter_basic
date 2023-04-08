import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'Item_product_view.dart';

class ProductListView extends StatelessWidget {
  const ProductListView({
    super.key, required this.name
  });

  final String name;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Center(
          child:GridView.builder(
              primary: false,
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) {
                return const ItemProductView();
              },
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(  
                crossAxisCount: constraints.maxWidth >= 850 ? 3 : 1,
                childAspectRatio: constraints.maxWidth >= 850 
                ? (MediaQuery.of(context).size.width/1.5) / (MediaQuery.of(context).size.height) 
                : (MediaQuery.of(context).size.width) / (MediaQuery.of(context).size.height/2.1),
              )
            ),
          );
      },
    );
  }

}

