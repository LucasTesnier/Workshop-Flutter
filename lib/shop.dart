import 'package:flutter/material.dart';

import 'main.dart';

void goToShopPage(BuildContext context, int cookies) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => ShopActivity(cookies: cookies)),
  );
}

class ShopActivity extends StatefulWidget {
  int cookies;
  ShopActivity({Key? key, required this.cookies}) : super(key: key);

  @override
  State<ShopActivity> createState() => _ShopActivityState();
}

class _ShopActivityState extends State<ShopActivity> {
  @override

  Widget build(BuildContext context) {
    int _cookies = widget.cookies;
    return MaterialApp(
        title: 'Shop !',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
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
                  'Welcome to shop ! Cookies : ' '$_cookies',
                  style: Theme.of(context).textTheme.headline5,
                ),
                FloatingActionButton(
                    onPressed: () {
                      goToHomePage(context, _cookies);
                    },
                    tooltip: 'Return home',
                    child: const Icon(Icons.home)),
              ],
            ),
          ),
        )));
  }
}
