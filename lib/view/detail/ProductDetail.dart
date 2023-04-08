import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../style/CustomSelector.dart';

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
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            toolbarHeight: 80,
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: Container(
                margin: const EdgeInsets.only(top: 30, left: 20),
                // padding: const EdgeInsets.only(top: 20, left: 20),
                alignment: Alignment.topLeft,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
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
            children: const [
              Expanded(child: DetailMainImage()),
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
  late Radius cardRadius;
  List<Selector> sizes = <Selector>[
    Selector("S", null, false),
    Selector("M", null, false),
    Selector("L", null, false)
  ];
  List<Selector> colors = <Selector>[
    Selector(null, 0xFFE6C3C3, false),
    Selector(null, 0xFF00CACA, false),
    Selector(null, 0xFFFFFFFF, false)
  ];
  

  @override
  void initState() {
    imageController = TabController(length: 3, vsync: this);
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
                  Image.asset(
                    'assets/images/cloth_1.jpg',
                    fit: BoxFit.cover,
                    width: constraints.maxWidth >= 850 ? constraints.maxWidth/2 : constraints.maxWidth,
                    height: constraints.maxWidth >= 850 ? constraints.maxHeight*1.5 : constraints.maxHeight/2,
                  ),
                  Image.asset(
                    'assets/images/cloth_1.jpg',
                    fit: BoxFit.cover,
                    width: constraints.maxWidth >= 850 ? constraints.maxWidth/2 : constraints.maxWidth,
                    height: constraints.maxWidth >= 850 ? constraints.maxHeight*1.5 : constraints.maxHeight/2,
                  ),
                  Image.asset(
                    'assets/images/cloth_1.jpg',
                    fit: BoxFit.cover,
                    width: constraints.maxWidth >= 850 ? constraints.maxWidth/2 : constraints.maxWidth,
                    height: constraints.maxWidth >= 850 ? constraints.maxHeight*1.5 : constraints.maxHeight/2,
                  ),
                ],
              )
            ),
            Positioned(
              top: constraints.maxWidth >= 850 ? constraints.maxHeight-50 : constraints.maxHeight/3-25,
              left: 0,
              right: constraints.maxWidth >= 850 ? constraints.maxWidth/2 : 0,
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
              left: constraints.maxWidth >= 850 ? constraints.maxWidth/2 : 0,
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
                        child: Text('男裝 U AIRism棉質寬版圓領T恤(五分袖)', style: TextStyle(fontSize: 20, color: Colors.grey.shade800)),
                      ),
                      subtitle: Container(
                        padding: const EdgeInsets.only(bottom:8, left: 4),
                        child: const Text('455359', style: TextStyle(fontSize: 13)),
                      )
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      padding: const EdgeInsets.only(bottom: 20, left: 20),
                      child: Text('NT\$450', style: TextStyle(fontSize: 20, color: Colors.grey.shade800)),
                    ),
                    Row(
                      children: [
                        const LabelTextView(content: '尺寸', fontSize: 13,),
                        Container(
                          alignment: Alignment.center,
                          height: 80,
                          padding: const EdgeInsets.only(bottom:8, left: 8),
                          child: CustomSelector(items: sizes, type: SelectorType.size)
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const LabelTextView(content: '顏色', fontSize: 13,),
                        Container(
                          alignment: Alignment.center,
                          height: 80,
                          padding: const EdgeInsets.only(bottom:8, left: 8),
                          child: CustomSelector(items: colors, type: SelectorType.color)
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
                    const LabelTextView(content: '實品顏色依單品照為主'),
                    const LabelTextView(content: '棉 100%'),
                    const LabelTextView(content: '厚薄: 薄'),
                    const LabelTextView(content: '彈性: 無'),
                    const LabelTextView(content: '素材產地: 日本'),
                    const LabelTextView(content: '加工產地: 中國'),
                    Container(
                      alignment: Alignment.topLeft,
                      padding: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
                      child: Column(
                        children: [
                          Text('細部說明', style: TextStyle(fontSize: 14, color: Colors.grey.shade800)),
                          const Padding(padding: EdgeInsets.all(8)),
                          Text('擁有棉質外觀且乾爽舒適的「AIRism」材質。寬鬆優美的版型也極具魅力。由藝術總監Christophe Lemaire所率領的團隊，與位於世界時尚及新素材彙集地巴黎的R&D中心，一同打造出追求高質感的衣著系列。\n\n・擁有高雅洗練的表面質感，內面為平滑性佳的特色舒適素材。\n・採用較窄的圓領設計，打造洗練印象。\n・5分袖設計。\n・特色在於落肩寬版的優美版型。\n・簡約的圓領設計T恤，可打造中性造型。\n・從休閒穿搭到洗練風格等各種造型都好搭配。', style: TextStyle(fontSize: 12, color: Colors.grey.shade500)),
                        ],
                    ),)
                ]),),
              )
              ),
          ]
        ),
      );
    });
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