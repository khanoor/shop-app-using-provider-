import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:producthub/global/global.dart';
import 'package:producthub/global/main_buttons.dart';
import 'package:producthub/view/home_page.dart';

import '../utils/utils.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController mobileNo = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController otp = TextEditingController();
  String otpPin = "";
  String countryDial = "+91";
  String verID = "";
  int screenState = 0;
  Future<void> verifyPhone(String number) async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: number,
      timeout: const Duration(seconds: 20),
      verificationCompleted: (PhoneAuthCredential credential) {
        Utils.showSnackBarText('Auth Completed!', context);
      },
      verificationFailed: (FirebaseAuthException e) {
        Utils.showSnackBarText("Auth Failed!", context);
        setState(() {
          sendOtpLoading = false;
        });
      },
      codeSent: (String verificationId, int? resendToken) {
        Utils.showSnackBarText("OTP Sent!", context);
        verID = verificationId;
        setState(() {
          screenState = 1;
        });
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        Utils.showSnackBarText("Timeout!", context);
      },
    );
  }

  Future<void> verifyOTP() async {
    try {
      FirebaseAuth auth = FirebaseAuth.instance;
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verID,
        smsCode: otpPin,
      );
      auth.signInWithCredential(credential).then((result) {
        if (result.user != null) {
          Navigator.pushAndRemoveUntil(
              context, switchScreenPush(context, HomePage()), (route) => false);
        }
      }).catchError((e) {
        print(e);
        Utils.showSnackBarText("Incorrect OTP!, Try Again", context);
      });
    } catch (e) {
      print("$e");
    }
  }

  bool sendOtpLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
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
            spaceBetween,
            screenState == 1
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      TextFormField(
                        controller: otp,
                        onChanged: (value) {
                          setState(() {
                            otpPin = value;
                          });
                        },
                        keyboardType: TextInputType.number,
                        maxLength: 6,
                        decoration: InputDecoration(
                          counterText: "",
                          border: OutlineInputBorder(),
                          hintText: "Enter OTP",
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0)),
                        ),
                      ),
                      spaceBetween,
                      MainButton(
                        title: "Login",
                        onPressed: () {
                          setState(() {
                            if (otp.text.length >= 6) {
                              verifyOTP();
                            } else {
                              Utils.flushBarErrorMessage(
                                  "Please Enter OTP", context);
                            }
                          });
                        },
                      ),
                    ],
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IntlPhoneField(
                        controller: phoneController,
                        showCountryFlag: true,
                        flagsButtonPadding: EdgeInsets.only(left: 20),
                        showDropdownIcon: false,
                        disableLengthCheck: false,
                        initialValue: countryDial,
                        onCountryChanged: (country) {
                          setState(() {
                            countryDial = "+" + country.dialCode;
                          });
                        },
                        decoration: InputDecoration(
                          counterText: "",
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          contentPadding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                        ),
                      ),
                      spaceBetween,
                      MainButton(
                        loading: sendOtpLoading,
                        title: "Send OTP",
                        onPressed: () {
                          switchScreenPush(context, HomePage());
                          setState(() {
                            sendOtpLoading = !sendOtpLoading;
                            if (phoneController.text != "") {
                              verifyPhone(countryDial + phoneController.text);
                            } else {
                              Utils.flushBarErrorMessage(
                                  "Please Enter Mobile Number", context);
                              sendOtpLoading = false;
                            }
                          });
                        },
                      ),
                    ],
                  ),
          ],
        ),
      ),
    );
  }
}
