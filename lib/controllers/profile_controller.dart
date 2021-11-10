import 'package:blog_post/database/helpers/user_helper.dart';
import 'package:blog_post/models/user_model.dart';
import 'package:blog_post/services/http_services_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  //Validations
  var isUsernameValid = true.obs;
  var isEmailValid = true.obs;
  var isFirstnameValid = true.obs;
  var isLastNameValid = true.obs;

  //Data variables

  //Loading
  var isUserLoading = true.obs;
  var isUserUpdate = false.obs;

  //Text Controllers
  final userTextController = TextEditingController();
  final emailTextController = TextEditingController();
  final firstNameTextController = TextEditingController();
  final lastNameTextController = TextEditingController();

  //Model /  Objects
  late UserModel user;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getUserDataFromDatabase();
  }

  void getUserDataFromDatabase() async {
    try {
      List<UserModel> users = await UserHelper.raedAllUser();
      user = users.first;
      userTextController.text = user.name!;
      emailTextController.text = user.email!;
      firstNameTextController.text = user.firstName!;
      lastNameTextController.text = user.lastName!;
      isUserLoading.value = false;
    } catch (ex) {
      isUserLoading.value = false;
      printError(info: ex.toString());
    }
  }

  void updateUser() async {
    isUserUpdate.value = true;
    try {
      Map<String, dynamic> reqBody = {
        "username": userTextController.text,
        "first_name": firstNameTextController.text,
        "last_name": lastNameTextController.text,
        "email": emailTextController.text
      };
      UserModel userModel =
          await HttpServicesProvider().updateUser(user.id!, reqBody);
      user = userModel;
      isUserUpdate.value = true;
    } catch (ex) {
      print(ex);
      isUserUpdate.value = true;
    }
  }
}
