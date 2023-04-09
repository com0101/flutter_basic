import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SlideImage extends StatefulWidget {
  const SlideImage({super.key});

  @override
  State<StatefulWidget> createState() => _SlideImage();
}

class _SlideImage extends State<SlideImage>
    with SingleTickerProviderStateMixin {
  late TabController imageController;

  @override
  void initState() {
    imageController = TabController(length: 6, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    imageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Stack(
        children: [
          Container(
            color: Colors.white,
            child: TabBarView(
              controller: imageController,
              children: [
                Image.asset(
                  'assets/images/cloth_2.jpg',
                  fit: BoxFit.cover,
                  width: constraints.maxWidth,
                ),
                Image.asset(
                  'assets/images/cloth_2.jpg',
                  fit: BoxFit.cover,
                  width: constraints.maxWidth,
                ),
                Image.asset(
                  'assets/images/cloth_2.jpg',
                  fit: BoxFit.cover,
                  width: constraints.maxWidth,
                ),
                Image.asset(
                  'assets/images/cloth_2.jpg',
                  fit: BoxFit.cover,
                  width: constraints.maxWidth,
                ),
                Image.asset(
                  'assets/images/cloth_2.jpg',
                  fit: BoxFit.cover,
                  width: constraints.maxWidth,
                ),
                Image.asset(
                  'assets/images/cloth_2.jpg',
                  fit: BoxFit.cover,
                  width: constraints.maxWidth,
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            height: 15,
            child: Container(
              height: 15,
              alignment: Alignment.center,
              child: TabPageSelector(
                controller: imageController,
                indicatorSize: 15,
                selectedColor: Colors.white,
              ),
            ),
          ),
        ],
      );
    });
  }
}