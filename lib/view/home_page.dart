import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:producthub/global/global.dart';
import 'package:producthub/view/favorite_page.dart';
import 'package:producthub/view/product_detail.dart';
import 'package:producthub/view/product_list_page.dart';
import 'package:producthub/view/setting_page.dart';
import 'package:producthub/view/wishlist_page.dart';
import 'package:producthub/view_model/filter_product_view_model.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  List braClass = [
    const ProductList(),
    const FavoritePage(),
    const WishlistPage(),
    const SettingPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            bottomNavigationBar: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
                color: AppColors.lightBlack,
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                child: GNav(
                    gap: 8,
                    padding: EdgeInsets.all(16),
                    backgroundColor: AppColors.lightBlack,
                    tabBackgroundColor: AppColors.greyColor,
                    onTabChange: (index) {
                      setState(() {
                        currentIndex = index;
                      });
                    },
                    tabs: [
                      GButton(
                        icon: Icons.home,
                        text: "Home",
                      ),
                      GButton(icon: Icons.favorite, text: "Favorite"),
                      GButton(
                        icon: Icons.production_quantity_limits_rounded,
                        text: "Wishlist",
                      ),
                      GButton(
                        icon: Icons.settings,
                        text: "Setting",
                      ),
                    ]),
              ),
            ),
            body: braClass[currentIndex]));
  }
}
