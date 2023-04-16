import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_stylish/blocs/product_cubit.dart';
import 'package:flutter_stylish/model/product_content.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../provider/product_detail_provider.dart';
import '../../style/custom_selector.dart';


class ProductDetailView extends StatefulWidget {
  const ProductDetailView({
    super.key, 
    required this.productId,
    required this.productContent});

  final String productId;
  final ProductContent productContent;

  @override
  State<StatefulWidget> createState() => _ProductDetailView();
}

class _ProductDetailView extends State<ProductDetailView> {
  late ProductCubit productCubit;

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
    return ChangeNotifierProvider(
      create: (context) => ProductDetailProvider(),
      child: LayoutBuilder(
        builder: (context, constaints) {
          return Scaffold(
            backgroundColor: Colors.white,
            extendBodyBehindAppBar: true,
            appBar: AppBar(
              toolbarHeight: 80,
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: Container(
                  margin: const EdgeInsets.only(top: 30, left: 20),
                  alignment: Alignment.topLeft,
                  child: ElevatedButton(
                    onPressed: () {
                      context.pop();
                    },
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(const CircleBorder()),
                      padding: MaterialStateProperty.all(const EdgeInsets.only(right: 2)),
                      backgroundColor: MaterialStateProperty.all(Colors.white70), // <-- Button color
                      overlayColor: MaterialStateProperty.resolveWith<Color?>((states) {
                        if (states.contains(MaterialState.pressed)) return Colors.white10; // <-- Splash color
                      }),
                    ),
                    child: Icon(Icons.arrow_back_rounded, color: Colors.grey.shade800),
                  )
                ),
            ),
            body: Column(
              children: [
                Expanded(child: DetailMainImage(product: widget.productContent,)),
              ],
            )
          );
        }
      ),
    );
  }
}

class DetailMainImage extends StatefulWidget {
  const DetailMainImage({super.key, required this.product});
  final ProductContent product;

  @override
  State<StatefulWidget> createState() => _DetailMainImage();
}

class _DetailMainImage extends State<DetailMainImage>
    with SingleTickerProviderStateMixin {
  late TabController imageController;
  late Radius cardRadius;

  @override
  void initState() {
    imageController = TabController(length: widget.product.images.length, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    imageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ProductContent product = widget.product;
    context.read<ProductDetailProvider>().getColorList(product.colors);
    context.read<ProductDetailProvider>().getSizeList(product.sizes);
    
    return LayoutBuilder(builder: (context, constraints) {
        cardRadius = constraints.maxWidth >= 850 ? const Radius.circular(0) : const Radius.circular(20);
        return SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                height: constraints.maxWidth >= 850 ? constraints.maxHeight*1.5 : constraints.minHeight*2,
              ),
              Container(
                height: constraints.maxWidth >= 850 ? constraints.maxHeight*1.5 : constraints.minHeight/2,
                color: Colors.white,
                child: TabBarView(
                  controller: imageController,
                  children: [
                    for(int x = 0; x<product.images.length; x++)...[
                      Image.network(
                        product.images[x],
                        fit: BoxFit.cover,
                        width: constraints.maxWidth >= 850 ? constraints.maxWidth/2 : constraints.maxWidth,
                        // height: constraints.maxWidth >= 850 ? constraints.maxHeight*1.5 : constraints.maxHeight/2,
                      ),
                    ],
                  ],
                )
              ),
              Positioned(
                top: constraints.maxWidth >= 850 ? constraints.maxHeight-50 : constraints.maxHeight/3-25,
                left: 0,
                right: constraints.maxWidth >= 850 ? constraints.maxWidth/3 : 0,
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
              Positioned(
                top: constraints.maxWidth >= 850 ? 0 : constraints.maxHeight/3,
                left: constraints.maxWidth >= 850 ? constraints.maxWidth/1.5 : 0,
                right: 0,
                child: SizedBox(
                  height: constraints.maxHeight*1.5,
                  child: Card(
                    margin: const EdgeInsets.only(left: 0, right: 0),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(cardRadius),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                       mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                      ListTile(
                        title: Container(
                          padding: const EdgeInsets.only(bottom: 8, top: 20, left: 4),
                          child: Text(product.title, style: TextStyle(fontSize: 20, color: Colors.grey.shade800)),
                        ),
                        subtitle: Container(
                          padding: const EdgeInsets.only(bottom:8, left: 4),
                          child: Text('${product.id}', style: TextStyle(fontSize: 13)),
                        )
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        padding: const EdgeInsets.only(bottom: 20, left: 20),
                        child: Text('NT\$${product.price}', style: TextStyle(fontSize: 20, color: Colors.grey.shade800)),
                      ),
                      Row(
                        children: [
                          const LabelTextView(content: '顏色', fontSize: 13,),
                          Container(
                            alignment: Alignment.center,
                            height: 80,
                            padding: const EdgeInsets.only(bottom:8, left: 8),
                            child: Consumer<ProductDetailProvider>(
                              builder: (context, value, child) =>
                                CustomSelector(items: value.colorSelector, type: SelectorType.color),
                            )   
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const LabelTextView(content: '尺寸', fontSize: 13,),
                          Container(
                            alignment: Alignment.center,
                            height: 80,
                            padding: const EdgeInsets.only(bottom:8, left: 8),
                            child: Consumer<ProductDetailProvider>(
                              builder: (context, value, child) =>
                                CustomSelector(items: value.sizeSelector, type: SelectorType.size),
                            )
                          ),
                        ],
                      ),
                      const LabelTextView(content: '數量', fontSize: 13,),
                      const AmountTextInput(),
                      Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.only(bottom: 8, top: 20),
                        child: ElevatedButton(
                          onPressed: () {
                            
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
                            
                        ),
                      ),
                      LabelTextView(content: product.description),
                      LabelTextView(content: product.note),
                      LabelTextView(content: '材質: ${product.texture}'),
                      LabelTextView(content: '清潔: ${product.wash}'),
                      LabelTextView(content: '產地: ${product.place}'),
                      Container(
                        alignment: Alignment.topLeft,
                        padding: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
                        child: Column(
                          children: [
                            Text('細部說明', style: TextStyle(fontSize: 14, color: Colors.grey.shade800)),
                            const Padding(padding: EdgeInsets.all(8)),
                            Text(product.story, style: TextStyle(fontSize: 12, color: Colors.grey.shade500)),
                          ],
                      ),)
                  ]),),
                )
                ),
            ]
          ),
        );
      }
    );
  }
}

class AmountTextInput extends StatelessWidget {
  const AmountTextInput({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          width: constraints.maxWidth,
          alignment: Alignment.center,
          padding: const EdgeInsets.only(bottom:16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
            Container(
              alignment: Alignment.topLeft,
              child: ElevatedButton(
                onPressed: () {
                  
                },
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(const CircleBorder()),
                  padding: MaterialStateProperty.all(const EdgeInsets.all(10)),
                  backgroundColor: MaterialStateProperty.all(Colors.white), // <-- Button color
                  overlayColor: MaterialStateProperty.resolveWith<Color?>((states) {
                    if (states.contains(MaterialState.pressed)) return Colors.grey.shade800; // <-- Splash color
                  }),
                ),
                child: const Icon(Icons.remove, color: Colors.grey),
              )
            ),
            Container(
              width: constraints.maxWidth/1.5,
              child: TextFormField(
                cursorColor: Colors.grey.shade800,
                initialValue: '1',
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                ],
                style: TextStyle(color: Colors.grey.shade800),
                decoration: InputDecoration(
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(width: 2, color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 2, color: Colors.grey.shade800),
                  ),
                ),
              )
            ),
            Container(
              alignment: Alignment.topRight,
              child: ElevatedButton(
                onPressed: () {
                  
                },
                child: const Icon(Icons.add, color: Colors.grey),
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(const CircleBorder()),
                  padding: MaterialStateProperty.all(const EdgeInsets.all(10)),
                  backgroundColor: MaterialStateProperty.all(Colors.white), // <-- Button color
                  overlayColor: MaterialStateProperty.resolveWith<Color?>((states) {
                    if (states.contains(MaterialState.pressed)) return Colors.grey.shade800; // <-- Splash color
                  }),
                ),
              )
            ),
          ],),
        );
      }
    );
  }
}

class LabelTextView extends StatelessWidget {
  const LabelTextView({
    super.key, required this.content, this.fontSize = 14, 
  });
  final String content;
  final double fontSize;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      padding: const EdgeInsets.only(bottom: 8, left: 20),
      child: Text(content, style: TextStyle(fontSize: fontSize, color: Colors.grey.shade800, fontWeight: FontWeight.bold))
    );
  }
}