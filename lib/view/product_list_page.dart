import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:producthub/view/product_detail.dart';
import 'package:provider/provider.dart';

import '../global/global.dart';
import '../view_model/filter_product_view_model.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  @override
  Widget build(BuildContext context) {
    return Consumer<FilterProduct>(
        builder: (BuildContext context, value, Widget? child) {
      return SafeArea(
          child: Scaffold(
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
                              selected: value.number.contains(index)
                                  ? value.isSelected
                                  : false,
                              label: Text(index == 0 ? "All" : "Product"),
                              onSelected: (bool val) {
                                if (value.number.contains(index)) {
                                  value.removeProduct(index);
                                } else {
                                  value.selectedProduct(val, index);
                                }
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
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
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
      ));
    });
  }
}
