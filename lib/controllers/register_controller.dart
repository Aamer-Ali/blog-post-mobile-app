import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  final emailTextController = TextEditingController();
  final usernameTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  final confirmPasswordTextController = TextEditingController();

  var isEmailValid = true.obs;
  var isUsernameValid = true.obs;
  var isPasswordValid = true.obs;
  var isConfirmPasswordValid = true.obs;

  bool validateUserForRegistration() {
    if (emailTextController.text.isEmpty || !emailTextController.text.isEmail) {
      isEmailValid.value = false;
    } else {
      isEmailValid.value = true;
    }
    if (usernameTextController.text.isEmpty) {
      isUsernameValid.value = false;
    } else {
      isUsernameValid.value = true;
    }
    if (passwordTextController.text.isEmpty) {
      isPasswordValid.value = false;
    } else {
      isPasswordValid.value = true;
    }
    if (confirmPasswordTextController.text.isEmpty ||
        confirmPasswordTextController.text !=
            confirmPasswordTextController.text) {
      isConfirmPasswordValid.value = false;
    } else {
      isConfirmPasswordValid.value = true;
    }
    if (isEmailValid.value &&
        isUsernameValid.value &&
        isPasswordValid.value &&
        isConfirmPasswordValid.value) {
      return true;
    } else {
      return false;
    }
  }
}
