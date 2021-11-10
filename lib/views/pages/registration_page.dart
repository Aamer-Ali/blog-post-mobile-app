import 'package:blog_post/controllers/register_controller.dart';
import 'package:blog_post/views/common_widgets/render_button.dart';
import 'package:blog_post/views/common_widgets/render_textbox.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final controller = Get.put(RegisterController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          renderTextBox(
              controller: controller.emailTextController,
              label: "Email",
              errorMessage: "Please Enter Email",
              errorFieldCheck: controller.isEmailValid.value,
              obscure: false,
              prefix: const FaIcon(FontAwesomeIcons.envelope)),
          renderTextBox(
              controller: controller.usernameTextController,
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
          renderTextBox(
              controller: controller.confirmPasswordTextController,
              label: "Confirm Password",
              errorFieldCheck: controller.isConfirmPasswordValid.value,
              errorMessage: "Please Enter Password",
              obscure: true,
              prefix: const FaIcon(FontAwesomeIcons.lock)),
          renderButton(
              onClick: () => controller.validateUserForRegistration(),
              label: "Register")
        ],
      ),
    );
  }
}
