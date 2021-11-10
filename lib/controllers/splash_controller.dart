import 'dart:async';

import 'package:blog_post/utils/constants.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SplashController extends GetxController {
  @override
  void onInit() async {
    super.onInit();
    await GetStorage.init(Constants().MY_GET_STOREAGE_CONTAINER);
  }

  void completeOperations(context) {
    Timer(const Duration(seconds: 2), () {
      int data = whereToGo(); // Where to go method called
      if (data == 0) {
        Navigator.pushReplacementNamed(context, "/authentication");
      } else if (data == 1) {
        Navigator.pushReplacementNamed(context, "/home");
      }
    });
  }

  int whereToGo() {
    final box = GetStorage(Constants().MY_GET_STOREAGE_CONTAINER);
    if (box.read(Constants().IS_USER_LOGIN_KEY) == null) {
      return 0;
    }
    bool isLogin = box.read(Constants().IS_USER_LOGIN_KEY);
    if (isLogin == true) {
      return 1;
    } else {
        return 0;
    }
  }
}
