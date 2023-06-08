import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:producthub/global/global.dart';
import 'package:producthub/global/main_buttons.dart';
import 'package:producthub/view/login_page.dart';
import 'package:producthub/view/test_post.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  FirebaseAuth.instance.signOut();
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                      (route) => false);
                });
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.logout),
                  Text("Logout", style: descriptionText)
                ],
              ),
            ),
            SizedBox(
              height: 100.h,
            ),
            MainButton(
              title: "TEST API",
              onPressed: () => switchScreenPush(context, TestLogin()),
            )
          ],
        ),
      ),
    ));
  }
}
