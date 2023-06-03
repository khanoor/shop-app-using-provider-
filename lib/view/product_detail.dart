import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:producthub/global/global.dart';
import 'package:provider/provider.dart';

import '../model/product_model.dart';
import '../view_model/favorite_view_model.dart';

class ProductDetail extends StatefulWidget {
  ProductDescription description;
  ProductDetail({super.key, required this.description});

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  final urlImages = [
    "https://img.freepik.com/free-photo/vivid-blurred-colorful-background_58702-2655.jpg?w=2000",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT2ImMEdy2t-vl_Cf0HGxnOLiPwUgCIZlGn4g&usqp=CAU",
    "https://static.vecteezy.com/system/resources/previews/001/984/880/original/abstract-colorful-geometric-overlapping-background-and-texture-free-vector.jpg",
  ];
  buildImage(String urlImage, int index) => Container(
        margin: EdgeInsets.symmetric(horizontal: 12),
        color: Colors.white,
        width: double.infinity,
        child: Image(image: NetworkImage(urlImage)),
      );
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
                            value.favItem.add(1);
                            // value.selectFavorite(index);
                          },
                          child: Icon(
                            value.favItem.contains(5)
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
                  "${widget.description.title}",
                  textAlign: TextAlign.left,
                  style: headingText,
                ),
                spaceBetween,
                Text(
                  "${widget.description.description}",
                  style: descriptionText,
                ),
                spaceBetween,
                CarouselSlider.builder(
                  itemCount: widget.description.images!.length,
                  options: CarouselOptions(
                    autoPlay: false,
                    reverse: true,
                  ),
                  itemBuilder: (context, index, realIndex) {
                    final urlImage = "${widget.description.images![index]}"[index];
                    return buildImage("${widget.description.images![index]}", index);
                  },
                ),
                Container(
                    height: 300.h,
                    child: Image(
                        image: NetworkImage("${widget.description.thumbnail}"))
                    // Image.asset("assets/1.jpg"),
                    ),
                RatingBar.builder(
                    allowHalfRating: true,
                    itemSize: 20,
                    ignoreGestures: true,
                    updateOnDrag: false,
                    initialRating: widget.description.rating!.toDouble(),
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
                            Expanded(
                                child: Text(" \$ ${widget.description.price}",
                                    style: normalText))
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                                child: Text(
                              "Brand: ",
                              style: normalText,
                            )),
                            Expanded(
                                child: Text("${widget.description.brand}",
                                    style: normalText))
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                                child: Text(
                              "Category:  ",
                              style: normalText,
                            )),
                            Expanded(
                                child: Text(
                              "${widget.description.category}",
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
                              "${widget.description.stock}",
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
