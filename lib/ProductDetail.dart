import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail({super.key});

  @override
  State<StatefulWidget> createState() => _ProductDetail();
}

class _ProductDetail extends State<ProductDetail> {
   @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: SystemUiOverlay.values);
    super.dispose();
  }
    
  @override
  initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.bottom]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constaints) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: Column(
            children: [
              const Expanded(child: DetailMainImage()),
              
            ],
          )
        );
      }
    );
  }
}

class DetailMainImage extends StatefulWidget {
  const DetailMainImage({super.key});

  @override
  State<StatefulWidget> createState() => _DetailMainImage();
}

class _DetailMainImage extends State<DetailMainImage>
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
            child: Image.asset(
              'assets/images/cloth_1.jpg',
              fit: BoxFit.cover,
              width: constraints.maxWidth,
            ),
          ),
          Positioned(
            top: 30,
            left: 16,
            right: 0,
            child: Container(
              alignment: Alignment.topLeft,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Icon(Icons.arrow_back_rounded, color: Colors.grey.shade800),
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(CircleBorder()),
                  padding: MaterialStateProperty.all(EdgeInsets.all(10)),
                  backgroundColor: MaterialStateProperty.all(Colors.white70), // <-- Button color
                  overlayColor: MaterialStateProperty.resolveWith<Color?>((states) {
                    if (states.contains(MaterialState.pressed)) return Colors.white10; // <-- Splash color
                  }),
                ),
              )
            ),
          ),
        ],
      );
    });
  }
}