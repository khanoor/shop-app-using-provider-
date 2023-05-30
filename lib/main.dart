import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:producthub/utils/routes/rotus.dart';
import 'package:producthub/utils/routes/routes_name.dart';
import 'package:producthub/view/login_page.dart';
import 'package:producthub/view_model/favorite_view_model.dart';
import 'package:producthub/view_model/filter_product_view_model.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => FilterProduct()),
        ChangeNotifierProvider(create: (_) => FavoriteProduct()),
      ],
      child: ScreenUtilInit(
          designSize: const Size(360, 800),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (BuildContext context, Widget? child) {
            return MaterialApp(
              title: 'Flutter Demo',
              theme: ThemeData(
                primarySwatch: Colors.blue,
              ),
              debugShowCheckedModeBanner: false,
              initialRoute: RoutesName.LoginPage,
              onGenerateRoute: Routes.generateRoute,
              home: LoginPage(),
            );
          }),
    );
  }
}
