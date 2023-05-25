import 'package:flutter/material.dart';
import 'package:producthub/global/global.dart';
import 'package:producthub/global/main_buttons.dart';
import 'package:producthub/view/products_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

TextEditingController mobileNo = TextEditingController();
TextEditingController otp = TextEditingController();

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(child: Image.asset("assets/login.png")),
            Text(
              "Login",
              style: headingText,
            ),
            Text(
              "Please login to continue",
              style: descriptionText,
            ),
            spaceBeteen,
            TextFormField(
              controller: mobileNo,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(), 
                hintText: "Enter Mobile Number",
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0)),
              ),
            ),
            spaceBeteen,
            Center(
              child: MainButton(
                title: "Send OTP",
                onPressed: () {
                  switchScreenPush(context, ProductsPage());
                },
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}
