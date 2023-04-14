import 'package:flutter/material.dart';

import '../../model/product_content.dart';

class ItemProductView extends StatelessWidget {
  const ItemProductView({
    super.key, required this.product
  });

  final ProductContent product;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      padding: const EdgeInsets.all(8.0), 
      child: Card(
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        elevation: 10,
        shape:const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
        child: InkWell(
          onTap: () {
            Navigator.pushNamed(context, "/productDetail");
          }, // item click
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
            Container(     
              height: 200,             
              child: Image.network(
                product.mainImage ?? 'assets/images/cloth_1.jpg', 
                fit: BoxFit.cover),
            ),
            Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.only(left:16, top: 20, right: 16),
              child: Text(product.title ?? '', style: const TextStyle(fontSize: 16)),
            ),
            Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.only(left:16, top: 10, right: 16, bottom: 20),
              child: Text('NT\$${product.price}', style: const TextStyle(fontSize: 15, color: Colors.grey)),
            ),       
          ],),
        )                   
      )
    );
  }
}