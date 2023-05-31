import 'dart:async';

import 'package:flutter/material.dart';
import 'package:producthub/global/global.dart';
import 'package:producthub/view/login_page.dart';
import 'package:producthub/view/products_page.dart';
import 'package:producthub/view_model/filter_product_view_model.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  void initState() {
    super.initState();
    startTime();
  }

  startTime() async {
    var _duration = const Duration(seconds: 3);
    return Timer(_duration, navigationPage);
  }

  void navigationPage() async {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => LoginPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/flash.gif"),
            Text(
              "PRODUCT HUB",
              style: headingText,
            )
          ],
        )),
      ),
    );
  }
}
