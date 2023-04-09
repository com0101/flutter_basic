import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_stylish/blocs/product_bloc.dart';
import 'package:flutter_stylish/blocs/product_state.dart';
import 'package:flutter_stylish/view/Home/product_list_view.dart';
import 'package:flutter_stylish/view/home/item_main_Image_view.dart';

import '../../blocs/product_event.dart';
import '../../style/circle_tab_indicator.dart';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<StatefulWidget> createState() => _Home();
}

class _Home extends State<Home> with SingleTickerProviderStateMixin {
  late TabController tabController;
  late ProductBloc productBloc;

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    productBloc = BlocProvider.of<ProductBloc>(context);
    productBloc.add(LoadProductEvent());
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            // Here we take the value from the MyHomePage object that was created by
            // the App.build method, and use it to set our appbar title.
            systemOverlayStyle: const SystemUiOverlayStyle(
              // Status bar color
              statusBarColor: Colors.white,
              // Status bar brightness
              statusBarIconBrightness:
                  Brightness.dark, // For Android (dark icons)
            ),
            backgroundColor: Colors.white,
            title: Image.asset('assets/images/Image_Logo.png', height: 38),
            centerTitle: true,
            toolbarHeight: 80,
            elevation: 0,
          ),
          body:  _status(state, tabController),
        );
      }
    );
  }
}

Widget _status(ProductState status, TabController tabController) {
  if(status is ProductLoadingState) {
    return const Center(
        child: CircularProgressIndicator(),
    );
  } else if (status is ProductSuccessState) {
    return ProductSuccessView(tabController: tabController);
  } else if (status is ProductErrorState) {

    return Center(child:  Text(status.error));
  }
  return Container();
}

class ProductSuccessView extends StatelessWidget {
  const ProductSuccessView({
    super.key,
    required this.tabController,
  });

  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Expanded(child: SlideImage()),
        PreferredSize(
            preferredSize: const Size.fromHeight(50),
            child: Material(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: TabBar(
                      isScrollable: true,
                      controller: tabController,
                      indicator: CircleTabIndicator(
                          color: Colors.grey.shade800, radius: 4.5),
                      labelStyle: const TextStyle(fontSize: 16.0),
                      labelColor: Colors.grey.shade800,
                      unselectedLabelColor: Colors.grey,
                      tabs: const [
                        Tab(text: '女裝'),
                        Tab(text: '男裝'),
                        Tab(text: '配件')
                      ]),
                ))),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 8, right: 8),
            child: TabBarView(
              controller: tabController,
              children: const [
                ProductListView(name: 'Girl'),
                ProductListView(name: 'Boy'),
                ProductListView(name: 'Acc'),
              ],
            ),
        ))
      ],
    );
  }
}
