import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:producthub/global/global.dart';
import 'package:producthub/view/product_detail.dart';
import 'package:producthub/view_model/filter_product_view_model.dart';
import 'package:provider/provider.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key});

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<FilterProduct>(
        builder: (BuildContext context, value, Widget? child) {
      return SafeArea(
        child: Scaffold(
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
              color: AppColors.lightBlack,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
              child: GNav(
                  gap: 8,
                  padding: EdgeInsets.all(16),
                  backgroundColor: AppColors.lightBlack,
                  tabBackgroundColor: AppColors.greyColor,
                  onTabChange: (index) {
                    print(index);
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
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Search",
                    prefixIcon: Icon(Icons.search_rounded),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0)),
                  ),
                ),
                spaceBetween,
                SizedBox(
                  height: 50.h,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Wrap(
                      spacing: 10,
                      children: List.generate(
                          10,
                          (index) => FilterChip(
                                selected: value.index.contains(index)
                                    ? value.isSelected
                                    : false,
                                label: Text(index == 0 ? "All" : "Product"),
                                onSelected: (bool val) {
                                  value.selectedProduct(val, index);
                                },
                              )),
                    ),
                  ),
                ),
                Divider(
                  height: 4.h,
                ),
                spaceBetween,
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 8.h,
                      ),
                      child: GestureDetector(
                        onTap: () => switchScreenPush(context, ProductDetail()),
                        child: GridView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: 5,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 6,
                                  mainAxisExtent: 200.h,
                                  mainAxisSpacing: 6),
                          itemBuilder: (_, index) {
                            return Container(
                              decoration: BoxDecoration(
                                  // boxShadow: [BoxShadow(blurRadius: 1.0)],
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white),
                              child: Column(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(30),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Image.asset(
                                        "assets/1.jpg",
                                        fit: BoxFit.contain,
                                        width: 250.w,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        Text(
                                          "Product Name ",
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              fontSize: 20.sp,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        Text(
                                          '\$ Price',
                                          style: descriptionText,
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
