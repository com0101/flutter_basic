import 'package:flutter/material.dart';
import 'Product.dart';

List<String> titles = <String>[
  'Girl',
  'Boy',
  'Acc',
];

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget  {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.grey,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<StatefulWidget> createState() => _MyHomePage();
}

class _MyHomePage extends State<MyHomePage> with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController (
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Image.asset('assets/images/Image_Logo.png', height: 38),
          centerTitle: true,
          toolbarHeight: 100,
          elevation: 0,
        ),
        body: Column(children: [
            // ListView.builder(
            //   scrollDirection: Axis.horizontal,
            //   itemCount: 25,
            //   itemBuilder: (BuildContext context, int index) {
            //     return ListTile(
            //       tileColor: Colors.grey.shade800,
            //       title: Text('${titles[0]} $index'),
            //     );
            //   },
            // ),
            PreferredSize(
              preferredSize: Size.fromHeight(40),
              child: Material(
                color: Colors.white,
                child: TabBar(
                  controller: tabController,
                  indicator: CircleTabIndicator(color: Colors.grey.shade800, radius: 5),
                  indicatorSize: TabBarIndicatorSize.label,   
                  tabs: const [
                  Tab(text: '女裝'),
                  Tab(text: '男裝'),
                  Tab(text: '配件')
                ]),
              ) 
            ),
            Expanded(
              child: TabBarView(
                controller: tabController,
                children: const [
                  Product(name: 'Girl'),
                  Product(name: 'Boy'),
                  Product(name: 'Acc'),
                ],
              ),
            )
        ],)
      ),
    );
  }
}

class CircleTabIndicator extends Decoration {
  final Color color;
  double radius;

  CircleTabIndicator({required this.color, required this.radius});

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]){
    return _CirclePainter(color:color, radius:radius);
  }
}

class _CirclePainter extends BoxPainter {

  final double radius;
  late Color color;
  _CirclePainter({required this.color, required this.radius});

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration cfg) {
    late  Paint _paint;
    _paint = Paint()..color = color;
    _paint = _paint ..isAntiAlias = true;
    final Offset circleOffset =
        offset + Offset(cfg.size!.width / 2, cfg.size!.height - radius);
    canvas.drawCircle(circleOffset, radius, _paint);
  }
}


