import 'package:flutter/material.dart';
import 'package:producthub/utils/routes/routes_name.dart';
import 'package:producthub/view/product_detail.dart';
import 'package:producthub/view/splash.dart';
import '../../view/login_page.dart';

class Routes {
  static MaterialPageRoute generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.ProductDetail:
        return MaterialPageRoute(
            builder: (BuildContext context) => const ProductDetail());
      case RoutesName.LoginPage:
        return MaterialPageRoute(
            builder: (BuildContext context) => const LoginPage());
      case RoutesName.splashScreen:
        return MaterialPageRoute(
            builder: (BuildContext context) => const Splash());
      default:
        return MaterialPageRoute(builder: (_) {
          return Scaffold(
            body: Center(
              child: Text("No route defined"),
            ),
          );
        });
    }
  }
}
