import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_stylish/model/product_content.dart';
import 'package:flutter_stylish/style/circle_tab_indicator.dart';
import '../../blocs/product/product_cubit.dart';
import '../../blocs/product/product_state.dart';
import 'Item_product_view.dart';

class ProductListView extends StatelessWidget {
  ProductListView({
    super.key, required this.catagory
  });
  final ProductCatagory catagory;
  late ProductCubit productCubit;

  @override
  Widget build(BuildContext context) {
    productCubit = BlocProvider.of<ProductCubit>(context);
    switch(catagory) {
      case ProductCatagory.women: productCubit.getWomenProducts();
      break;
      case ProductCatagory.men: productCubit.getMenProducts();
      break;
      case ProductCatagory.accessory: productCubit.getAccessoriesProducts();
      break;
    }
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        return _status(state);
      }
    );
  }

  Widget _status(ProductState status) {
    if(status is ProductLoadingState) {
      return const Center(
          child: CircularProgressIndicator(),
      );
    } else if (status is ProductSuccessState) {
      return SuccessView(products: status.products);
    } else if (status is ProductErrorState) {
      return Center(child:  Text(status.error));
    }
    return Container();
  }

}

class SuccessView extends StatelessWidget {
  const SuccessView({
    super.key, required this.products
  });

  final List<ProductContent> products; 

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Center(
          child:GridView.builder(
              primary: false,
              itemCount: products.length,
              itemBuilder: (BuildContext context, int index) {
                return ItemProductView(product: products[index]);
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

