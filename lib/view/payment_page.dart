import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:producthub/global/global.dart';
import 'package:producthub/global/main_buttons.dart';

import '../model/product_model.dart';

class PaymentPage extends StatefulWidget {
  ProductDescription description;
  PaymentPage({super.key, required this.description});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
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
                  Text(
                    "Payment Method",
                    style: headingText,
                  ),
                ],
              ),
              SizedBox(
                height: 60.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 100.h,
                    width: 100.w,
                    decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(8)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.credit_card_rounded,
                          size: 50,
                        ),
                        Text(
                          "Credit Card",
                          style: text2,
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 100.h,
                    width: 100.w,
                    decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(8)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.credit_card_rounded,
                          size: 50,
                        ),
                        Text(
                          "Debit",
                          style: text2,
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 100.h,
                    width: 100.w,
                    decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(8)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.qr_code,
                          size: 50,
                        ),
                        Text(
                          "UPI",
                          style: text2,
                        )
                      ],
                    ),
                  ),
                ],
              ),
              spaceBetween,
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 50.h,
                    child: Image(
                        image: NetworkImage("${widget.description.thumbnail}")),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.description.title.toString()),
                      Row(
                        children: [
                          Text("Price: \$${widget.description.price}"),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              spaceBetween,
              MainButton(
                  title: "Paynow \$${widget.description.price}",
                  onPressed: () {})
            ],
          ),
        ),
      ),
    ));
  }
}
