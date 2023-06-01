// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

TextStyle headingText = TextStyle(
    color: Colors.black, fontSize: 30.sp, fontWeight: FontWeight.w600);

TextStyle descriptionText = TextStyle(color: Colors.grey, fontSize: 14.sp);
TextStyle normalText = TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold);

class AppColors {
  static const Color blackColor = Color(0XFF373737);
  static const Color whiteColor = Color(0XFFFFFFFF);
  static const Color greyColor = Color.fromARGB(255, 207, 207, 207);
  static const Color lightBlack = Color(0XFF808080);
}

SizedBox spaceBetween = SizedBox(height: 8.h);

switchScreenPush(context, screen) {
  return Navigator.push(
      context,
      PageRouteBuilder(
          pageBuilder: (
            context,
            _,
            __,
          ) =>
              screen,
          transitionDuration: Duration.zero,
          reverseTransitionDuration: Duration.zero));
}

switchScreenReplacement(context, screen) {
  return Navigator.pop(
      context,
      PageRouteBuilder(
          pageBuilder: (context, _, __) => screen,
          transitionDuration: Duration.zero,
          reverseTransitionDuration: Duration.zero));
}
