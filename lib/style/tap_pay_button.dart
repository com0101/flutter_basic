
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tappay/flutter_tappay.dart';

import '../blocs/product/product_cubit.dart';
import '../blocs/product/product_state.dart';

class TapPayButton extends StatefulWidget {
  const TapPayButton({
    super.key,
  });

  @override
  State<StatefulWidget> createState() => _TapPayButton();
}

class _TapPayButton extends State<TapPayButton> {
  late ProductCubit productCubit;


  @override
  Widget build(BuildContext context) {
    productCubit = BlocProvider.of<ProductCubit>(context);
    return BlocBuilder<ProductCubit, ProductState>(
        builder: (context, state) {
          return ElevatedButton(
            onPressed: () async {
              productCubit.checkoutProduct();
              ScaffoldMessenger.of(context).showSnackBar(_status(state));
            },
            style: ElevatedButton.styleFrom(
              textStyle: const TextStyle(color: Colors.white),
              padding: const EdgeInsets.all(16),
              backgroundColor: Colors.grey.shade800, // <-- Button color
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0)),
              minimumSize: const Size(250, 60),
            ),
            child: const Text('加入購物車'),
          );
       }
    );
  }

  SnackBar _status(ProductState status) {
    if (status is PaymentSuccessState) {
      return SnackBar(
        content: Text(status.message),
      );
    } else if (status is ProductErrorState) {
      return SnackBar(
        content: Text(status.error),
      );
    }
    return const SnackBar(
        content: Text('empty')
    );
  }
}