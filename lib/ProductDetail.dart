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
  late double fontSize;
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
      fontSize = constraints.maxWidth >= 850 ? 24 : 16;
      return Stack(
        children: [
          Container(
            color: Colors.white,
            child: Image.asset(
              'assets/images/cloth_1.jpg',
              fit: BoxFit.cover,
              width: constraints.maxWidth,
              height: constraints.maxWidth >= 850 ? constraints.maxHeight : constraints.maxHeight/2,
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
          Positioned(
            top: constraints.maxWidth >= 850 ? 50 : constraints.maxHeight/3,
            left: constraints.maxWidth >= 850 ? constraints.maxWidth/2 : 0,
            right: constraints.maxWidth >= 850 ? 50 : 0,
            child: Container(
              height: constraints.maxHeight,
              child: Card(
                margin: EdgeInsets.zero,
                elevation: 10,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
                ),
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: [
                  ListTile(
                    title: Container(
                      padding: const EdgeInsets.only(bottom: 8, top: 20, left: 4),
                      child: Text('男裝 U AIRism棉質寬版圓領T恤(五分袖)', style: TextStyle(fontSize: 24)),
                    ),
                    subtitle: Container(
                      padding: const EdgeInsets.only(bottom:8, left: 4),
                      child: Text('455359', style: TextStyle(fontSize: 15)),
                    )
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    padding: const EdgeInsets.only(bottom: 20, left: 20),
                    child: Text('NT\$450', style: TextStyle(fontSize: 24)),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    padding: const EdgeInsets.only(bottom: 8, left: 20),
                    child: Text('尺寸', style: TextStyle(fontSize: 15, color: Color(0xFF3B4257), fontWeight: FontWeight.bold))
                  ),
                  Container(
                    height: 80,
                    padding: EdgeInsets.only(bottom:16, left: 8),
                    child: CustomSelector(items: sizes, type: SelectorType.size)),
                  Container(
                    alignment: Alignment.topLeft,
                    padding: const EdgeInsets.only(bottom: 8, left: 20),
                    child: Text('顏色', style: TextStyle(fontSize: 15,  color: Color(0xFF3B4257), fontWeight: FontWeight.bold))
                  ),
                  Container(
                    height: 80,
                    padding: EdgeInsets.only(bottom:16, left: 8),
                    child: CustomSelector(items: colors, type: SelectorType.color)
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    padding: const EdgeInsets.only(bottom: 8, left: 20),
                    child: Text('數量', style: TextStyle(fontSize: 15,  color: Color(0xFF3B4257), fontWeight: FontWeight.bold))
                  ),
                  Container(
                    width: constraints.maxWidth,
                    padding: EdgeInsets.only(bottom:16, left: 5, right: 20),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                      Container(
                        alignment: Alignment.topLeft,
                        child: ElevatedButton(
                          onPressed: () {
                            
                          },
                          child: Icon(Icons.remove, color: Colors.grey),
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all(CircleBorder()),
                            padding: MaterialStateProperty.all(EdgeInsets.all(10)),
                            backgroundColor: MaterialStateProperty.all(Colors.white), // <-- Button color
                            overlayColor: MaterialStateProperty.resolveWith<Color?>((states) {
                              if (states.contains(MaterialState.pressed)) return Color(0xFF3B4257); // <-- Splash color
                            }),
                          ),
                        )
                      ),
                      Container(
                        width: 200,
                        child: TextFormField(
                          cursorColor: Color(0xFF3B4257),
                          initialValue: '1',
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly
                          ],
                          style: const TextStyle(color: Color(0xFF3B4257)),
                          decoration: const InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(width: 2, color: Colors.grey),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(width: 2, color: Color(0xFF3B4257)),
                            ),
                          ),
                        )
                      ),
                      Container(
                        alignment: Alignment.topRight,
                        child: ElevatedButton(
                          onPressed: () {
                            
                          },
                          child: Icon(Icons.add, color: Colors.grey),
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all(CircleBorder()),
                            padding: MaterialStateProperty.all(EdgeInsets.all(10)),
                            backgroundColor: MaterialStateProperty.all(Colors.white), // <-- Button color
                            overlayColor: MaterialStateProperty.resolveWith<Color?>((states) {
                              if (states.contains(MaterialState.pressed)) return Color(0xFF3B4257); // <-- Splash color
                            }),
                          ),
                        )
                      ),
                    ],),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    padding: const EdgeInsets.only(bottom: 8, left: 20, top: 16),
                    child: ElevatedButton(
                      onPressed: () {
                        
                      },
                      child: Text('加入購物車'),
                      style: ElevatedButton.styleFrom(
                        textStyle: TextStyle(color: Colors.white),
                        padding: EdgeInsets.all(16),
                        backgroundColor: Color(0xFF3B4257), // <-- Button color
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0)),
                          minimumSize: Size(250, 60), //////// HERE
                        ),
                        
                    ),
                  ),
              ]),)
              )
            ),
        ]
      );
    });
  }
}

class CustomSelector extends StatefulWidget {
  const CustomSelector({
    super.key, required this.items, required this.type
  });

  final List<Selector> items;
  final SelectorType type;
  @override
  _CustomSelector createState() => _CustomSelector();
}

class _CustomSelector extends State<CustomSelector> {

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.items.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              setState(() {
                widget.items..forEach((gender) => gender.isSelected = false);
                widget.items[index].isSelected = true;
              });
            },
            child: widget.type == SelectorType.size ? SizeRadio(widget.items[index]): ColorRadio(widget.items[index]),
          );
        });
  }
}

class SizeRadio extends StatelessWidget {
  Selector selector;

  SizeRadio(this.selector);

  @override
  Widget build(BuildContext context) {
    return Card(
        shape:const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(50)),
        ),
        margin: EdgeInsets.all(10),
        color: selector.isSelected ? Color(0xFF3B4257) : Colors.white,
        child: Container(
          height: 20,
          width: 44,
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                selector.name ?? '',
                style: TextStyle(
                    color: selector.isSelected ? Colors.white : Colors.grey),
              )
            ],
          ),
        ));
  }
}

class ColorRadio extends StatelessWidget {
  Selector selector;

  ColorRadio(this.selector);

  @override
  Widget build(BuildContext context) {
    return Card(
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 2,
            color: selector.isSelected ? Color(0xFF3B4257) : Colors.grey.shade200,
          ),
          borderRadius: BorderRadius.all(Radius.circular(50)),
        ),
        margin: EdgeInsets.all(10),
        color: Color(selector.color ?? 0xFF3B4257),
        child: Container(
          height: 20,
          width: 44,
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                selector.name ?? '',
                style: TextStyle(
                    color: selector.isSelected ? Colors.white : Colors.grey),
              )
            ],
          ),
        ));
  }
}

enum SelectorType { size, color }

class Selector {
  String? name;
  int? color;
  bool isSelected;

  Selector(this.name, this.color, this.isSelected);
}
