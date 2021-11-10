import 'package:blog_post/utils/styling.dart';
import 'package:blog_post/views/pages/login_page.dart';
import 'package:blog_post/views/pages/registration_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthenticationScreen extends StatefulWidget {
  const AuthenticationScreen({Key? key}) : super(key: key);

  @override
  State<AuthenticationScreen> createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  final _authPageController = PageController();
  var buttonText = "Don't have Account. Register";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Blog - Post",
                style: Theme.of(context).textTheme.headline3,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: Get.height / 1.3,
                child: PageView(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: _authPageController,
                  children: const [
                    LoginPage(),
                    RegistrationPage(),
                  ],
                ),
              ),
              TextButton(
                  onPressed: () {
                    _changePage();
                  },
                  child: Text(buttonText))
            ],
          ),
        ),
      ),
    );
  }

  _changePage() {
    try {
      if (_authPageController.page == 0.0) {
        _authPageController.animateToPage(1,
            duration: const Duration(milliseconds: 200), curve: Curves.ease);
        setState(() {
          buttonText = "Have an account. Login";
        });
      } else if (_authPageController.page == 1.0) {
        _authPageController.animateToPage(0,
            duration: const Duration(milliseconds: 200), curve: Curves.ease);
        setState(() {
          buttonText = "Don't have Account. Register";
        });
      }
    } catch (ex) {
      print(ex);
    }
  }
}
