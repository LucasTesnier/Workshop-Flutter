import 'package:flutter/material.dart';
import 'package:workshop_flutter/shop.dart';

void main() {
  runApp(MyApp(cookies: 0));
}

void goToHomePage(BuildContext context, int cookies) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => MyApp(cookies: cookies)),
  );
}

class MyApp extends StatelessWidget {
  MyApp({Key? key, required this.cookies}) : super(key: key);

  int cookies;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cookie Clicker',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Cookie Clicker', cookies: cookies),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title, required this.cookies}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;
  int cookies;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    _counter = widget.cookies;

    void _incrementCounter() {
      setState(() {
        // This call to setState tells the Flutter framework that something has
        // changed in this State, which causes it to rerun the build method below
        // so that the display can reflect the updated values. If we changed
        // _counter without calling setState(), then the build method would not be
        // called again, and so nothing would appear to happen.
        widget.cookies++;
      });
    }
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
          image: AssetImage("assets/background.png"),
          fit: BoxFit.cover,
          ),
      ),

        child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Vous avez : ' '$_counter' ' cookies !',
              style: Theme.of(context).textTheme.headline5,
            ),
            GestureDetector(
              onTap: _incrementCounter,
              child: const Image(image: AssetImage('assets/cookie.png')),
            ),
            FloatingActionButton(
              onPressed : () {
                goToShopPage(context, _counter);
              },
              tooltip: 'Go to shop',
              child: const Icon(Icons.shop)
            ),
          ],
        ),
      ),
    ));
  }
}
