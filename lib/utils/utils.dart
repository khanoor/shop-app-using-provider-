import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';

class Utils {
  static toastMessage(String message) {
    Fluttertoast.showToast(msg: message);
  }
  static void flushBarErrorMessage(String message, BuildContext context) {
    showFlushbar(
        context: context,
        flushbar: Flushbar(
          forwardAnimationCurve: Curves.decelerate,
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          padding: const EdgeInsets.all(15),
          message: message,
          duration: const Duration(seconds: 3),
          backgroundColor: Colors.red,
          reverseAnimationCurve: Curves.easeInOut,
          borderRadius: BorderRadius.circular(8),
          positionOffset: 20,
          flushbarPosition: FlushbarPosition.TOP,
          icon: const Icon(
            Icons.error,
            size: 20,
            color: Colors.white,
          ),
        )..show(context));
  }
}
