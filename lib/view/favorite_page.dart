import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:producthub/global/global.dart';
import 'package:producthub/view/product_detail.dart';
import 'package:provider/provider.dart';

import '../view_model/favorite_view_model.dart';
import '../view_model/filter_product_view_model.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: SingleChildScrollView(
        child: Consumer<FilterProduct>(
            builder: (BuildContext context, value, Widget? child) {
          return Consumer<FavoriteProduct>(
              builder: (BuildContext context, value, Widget? child) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20.h,
                  ),
                  value.testProduct.length == 0
                      ? Center(
                          child: Text(
                            "No favorite item",
                            style: text2,
                          ),
                        )
                      : ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: value.testProduct.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {},
                              child: Container(
                                width: double.infinity,
                                margin: EdgeInsets.only(bottom: 6.h),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                        height: 50.h,
                                        child: Image(
                                            image: NetworkImage(value
                                                .testProduct[index]
                                                .thumbnail))),
                                    SizedBox(
                                      width: 10.w,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(value.testProduct[index].title),
                                        Row(
                                          children: [
                                            Text(
                                                "Price: \$ ${value.testProduct[index].price}"),
                                            SizedBox(
                                              width: 20.w,
                                            ),
                                            Text(
                                                "Stock: ${value.testProduct[index].stock}"),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Spacer(),
                                    GestureDetector(
                                        onTap: () {
                                          // value.testProduct.remove(value.testProduct[index]);
                                          },
                                        child: Icon(
                                          Icons.favorite,
                                          size: 30,
                                        )),
                                  ],
                                ),
                              ),
                            );
                          }),
                ],
              ),
            );
          });
        }),
      ),
    ));
  }
}
