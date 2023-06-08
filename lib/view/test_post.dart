import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:producthub/global/global.dart';
import 'package:producthub/global/main_buttons.dart';
import 'package:producthub/utils/utils.dart';
import 'package:provider/provider.dart';

import '../view_model/login_post_view_model.dart';

class TestLogin extends StatefulWidget {
  const TestLogin({super.key});

  @override
  State<TestLogin> createState() => _TestLoginState();
}

class _TestLoginState extends State<TestLogin> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(title: Text("Test Login")),
      body: Consumer<AuthViewModel>(
          builder: (BuildContext context, value, Widget? child) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
            TextField(
              controller: email,
              decoration: InputDecoration(hintText: "email"),
            ),
            spaceBetween,
            TextField(
              maxLength: 6,
              controller: password,
              decoration: InputDecoration(hintText: "Password"),
            ),
            spaceBetween,
            MainButton(
                title: "hit API",
                loading: value.loading,
                onPressed: () {
                  if (email.text.isEmpty) {
                    Utils.toastMessage("Enrer email");
                  } else if (password.text.isEmpty) {
                    Utils.toastMessage("Enter Password");
                  } else if (password.text.length < 6) {
                    Utils.showSnackBarText("enter 6 digits password", context);
                  } else {
                    Map data = {
                      'email': email.text.toString(),
                      'password': password.text.toString()
                    };
                    value.loginApi(data, context);
                    print("API hit");
                  }
                }),
          ]),
        );
      }),
    ));
  }
}
  