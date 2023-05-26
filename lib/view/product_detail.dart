import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
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
        body: Padding(
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
                    return IconButton(
                      splashColor: Colors.transparent,
                      onPressed: () {
                        value.selectFavorite(!value.isfavorite);
                      },
                      icon: Icon(
                        value.isfavorite
                            ? Icons.favorite
                            : Icons.favorite_border,
                        size: 30,
                      ),
                    );
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
