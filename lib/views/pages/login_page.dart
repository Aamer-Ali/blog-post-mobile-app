import 'package:blog_post/controllers/login_controller.dart';
import 'package:blog_post/views/common_widgets/render_button.dart';
import 'package:blog_post/views/common_widgets/render_textbox.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          renderTextBox(
              controller: controller.userNameTextController,
              label: "Username",
              errorMessage: "Please Enter Username",
              errorFieldCheck: controller.isUsernameValid.value,
              obscure: false,
              prefix: const FaIcon(FontAwesomeIcons.users)),
          renderTextBox(
              controller: controller.passwordTextController,
              label: "Password",
              errorFieldCheck: controller.isPasswordValid.value,
              errorMessage: "Please Enter Password",
              obscure: true,
              prefix: const FaIcon(FontAwesomeIcons.lock)),
          renderButton(
              onClick: () => controller.loginUser(context), label: "Login")
        ],
      ),
    );
  }
}
