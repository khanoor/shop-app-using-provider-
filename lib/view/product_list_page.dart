import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:producthub/view/product_detail.dart';
import 'package:provider/provider.dart';
import '../global/global.dart';
import '../model/product_model.dart';
import '../view_model/filter_product_view_model.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  @override
  void initState() {
    final p = Provider.of<FilterProduct>(context, listen: false);
    p.getProductDetails(context);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<FilterProduct>(
        builder: (BuildContext context, value, Widget? child) {
      return SafeArea(
          child: Scaffold(
        body:
            // value.productList.length == 0
            //     ? Center(
            //         child: CircularProgressIndicator(),
            //       )
            //     :
            Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextFormField(
                onChanged: onSerachDestination,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Search ",
                  prefixIcon: Icon(Icons.search_rounded),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0)),
                ),
              ),
              // spaceBetween,
              // SizedBox(
              //   height: 50.h,
              //   child: SingleChildScrollView(
              //     scrollDirection: Axis.horizontal,
              //     child: Wrap(
              //       spacing: 10,
              //       children: List.generate(
              //           value.category.length,
              //           (index) => FilterChip(
              //                 selected: value.number.contains(index)
              //                     ? value.isSelected
              //                     : false,
              //                 label: Text(index == 0
              //                     ? "All"
              //                     : "${value.category[index]}"),
              //                 onSelected: (bool val) {
              //                   if (value.number.contains(index)) {
              //                     value.removeProduct(index);
              //                     value.setcatName("");
              //                   } else {
              //                     value.selectedProduct(val, index);
              //                     value.setcatName(value.category[index]);
              //                   }
              //                 },
              //               )),
              //     ),
              //   ),
              // ),
              // Divider(
              //   height: 4.h,
              // ),
              spaceBetween,
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 8.h,
                    ),
                    child: GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: value.productList.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 6,
                          mainAxisExtent: 200.h,
                          mainAxisSpacing: 6),
                      itemBuilder: (Builder, index) {
                        return
                            // value.productList[index].category ==
                            //         value.catName
                            //     ?
                            GestureDetector(
                                onTap: () => switchScreenPush(
                                    context,
                                    ProductDetail(
                                      description: value.productList[index],
                                    )),
                                child: Container(
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
                                            child: SizedBox(
                                              height: 120.h,
                                              child: Image(
                                                  fit: BoxFit.cover,
                                                  image: NetworkImage(
                                                    "${value.productList[index].thumbnail}",
                                                  )),
                                            )),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          children: [
                                            Text(
                                              "${value.productList[index].title}",
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  fontSize: 20.sp,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            Text(
                                              '\$ ${value.productList[index].price}',
                                              style: descriptionText,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ));
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ));
    });
  }

  onSerachDestination(String text) {
    final serachData = Provider.of<FilterProduct>(context, listen: false);

    final List<ProductDescription> filter = [];
    serachData.tempSearch.map((value) {
      if (value.title!.toLowerCase().contains(text.toString().toLowerCase())
          //     ||
          // value.destinationCode
          //     .toLowerCase()
          //     .contains(text.toString().toLowerCase()) ||
          // value.countryName.contains(text.toString().toLowerCase()) ||
          // value.countryIsoCode
          //     .toLowerCase()
          //     .contains(text.toString().toLowerCase())
          ) {
        filter.add(value);
      }
    }).toList();
    serachData.setSearchData(filter);
  }
}
