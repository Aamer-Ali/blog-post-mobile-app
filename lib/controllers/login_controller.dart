import 'package:blog_post/database/helpers/user_helper.dart';
import 'package:blog_post/models/user_model.dart';
import 'package:blog_post/services/http_services_provider.dart';
import 'package:blog_post/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  final userNameTextController = TextEditingController();
  final passwordTextController = TextEditingController();

  var isUsernameValid = true.obs;
  var isPasswordValid = true.obs;

  var isLoginUserLoading = false.obs;
  var isUserNotFound = false.obs;

  bool validateLoginForm() {
    if (userNameTextController.text.isEmpty) {
      isUsernameValid.value = false;
    } else {
      isUsernameValid.value = true;
    }
    if (passwordTextController.text.isEmpty) {
      isPasswordValid.value = false;
    } else {
      isPasswordValid.value = true;
    }
    if (isUsernameValid.value && isPasswordValid.value) {
      return true;
    } else {
      return false;
    }
  }

  void loginUser(context) async {
    if (validateLoginForm()) {
      try {
        isLoginUserLoading.value = true;
        Map<String, dynamic> reqBody = {
          "username": userNameTextController.text,
          "password": passwordTextController.text
        };
        UserModel? response = await HttpServicesProvider().loginUser(reqBody);
        isLoginUserLoading.value = false;
        if (response != null) {
          try {
            UserModel user = await UserHelper.createUser(UserModel(
                id: response.id!,
                name: response.name!,
                firstName: response.firstName!,
                lastName: response.lastName!,
                email: response.email!,
                profilePic: response.profilePic));
            final box = GetStorage(Constants().MY_GET_STOREAGE_CONTAINER);
            box.write(Constants().IS_USER_LOGIN_KEY, true);
            Navigator.pushReplacementNamed(context, "/home");
          } catch (ex) {
            print(ex);
          }
          isUserNotFound.value = false;
        } else {
          isUserNotFound.value = true;
        }
      } catch (ex) {
        isLoginUserLoading.value = false;
        isUserNotFound.value = true;
      }
    }
  }
}
