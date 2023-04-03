import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'ProductDetail.dart';

class Product extends StatelessWidget {
  const Product({
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

class ItemProductView extends StatelessWidget {
  const ItemProductView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
              child: Image.asset(
                'assets/images/cloth_1.jpg', 
                fit: BoxFit.cover),
            ),
            Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.only(left:16, top: 20, right: 16),
              child: Text('男裝 U AIRism棉質寬版圓領T恤(五分袖) 455359', style: TextStyle(fontSize: 16)),
            ),
            Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.only(left:16, top: 10, right: 16, bottom: 20),
              child: Text('NT\$250', style: TextStyle(fontSize: 15, color: Colors.grey)),
            ),       
          ],),
        )                   
      )
    );
  }
}