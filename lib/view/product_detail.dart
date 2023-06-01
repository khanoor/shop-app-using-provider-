import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:producthub/global/global.dart';
import 'package:provider/provider.dart';

import '../view_model/favorite_view_model.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail({super.key});

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  children: [
                    IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: Icon(
                          Icons.arrow_circle_left_outlined,
                          size: 30,
                        )),
                    Spacer(),
                    Consumer<FavoriteProduct>(
                        builder: (BuildContext context, value, Widget? child) {
                      return GestureDetector(
                          onTap: () {
                            value.selectFavorite(!value.isfavorite);
                          },
                          child: Icon(
                            value.isfavorite
                                ? Icons.favorite
                                : Icons.favorite_border,
                            size: 30,
                          ));
                    }),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  "Product Name size: 40,size: 40,size: 40,size: 40,size: 40,",
                  textAlign: TextAlign.left,
                  style: headingText,
                ),
                spaceBetween,
                Text(
                  "SIM-Free, Model A19211 6.5-inch Super Retina HD display with OLED technology A12 Bionic chip with ...",
                  style: descriptionText,
                ),
                spaceBetween,
                Container(
                  height: 300.h,
                  child: Image.asset("assets/1.jpg"),
                ),
                RatingBar.builder(
                    allowHalfRating: true,
                    itemSize: 20,
                    ignoreGestures: true,
                    updateOnDrag: false,
                    initialRating: 3.1,
                    direction: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                    onRatingUpdate: (rating) {
                      print(rating);
                    }),
                spaceBetween,
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Product Details:",
                          style: TextStyle(
                              fontSize: 20.sp, fontWeight: FontWeight.w500),
                        ),
                        Row(
                          children: [
                            Expanded(child: Text("Price: ", style: normalText)),
                            Expanded(child: Text(" \$ 4565", style: normalText))
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                                child: Text(
                              "Brand: ",
                              style: normalText,
                            )),
                            Expanded(child: Text("APPLE", style: normalText))
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                                child: Text(
                              "Category: ",
                              style: normalText,
                            )),
                            Expanded(
                                child: Text(
                              "MOBILE",
                              style: normalText,
                            ))
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                                child: Text(
                              "Stock: ",
                              style: normalText,
                            )),
                            Expanded(
                                child: Text(
                              "50",
                              style: normalText,
                            ))
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
