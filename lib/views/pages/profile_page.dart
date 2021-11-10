import 'package:blog_post/controllers/profile_controller.dart';
import 'package:blog_post/utils/styling.dart';
import 'package:blog_post/views/common_widgets/progress_view.dart';
import 'package:blog_post/views/common_widgets/render_button.dart';
import 'package:blog_post/views/common_widgets/render_textbox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final controller = Get.put(ProfileController());
  var _isError = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          elevation: 10,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Obx(
              () => controller.isUserLoading.value
                  ? ProgressView(message: "Loading Profile")
                  : Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CircleAvatar(
                          backgroundImage: _isError
                              ? null
                              : NetworkImage(controller.user.profilePic),
                          onBackgroundImageError: _isError
                              ? null
                              : (object, stackTrace) {
                                  setState(() {
                                    _isError = true;
                                  });
                                },
                          radius: Get.height / 10,
                          backgroundColor: Colors.blueGrey,
                          child: !_isError
                              ? null
                              : SvgPicture.asset(
                                  'assets/images/avatar.svg',
                                  width: Get.width,
                                  height: Get.height / 7,
                                ),
                        ),
                        renderTextBox(
                            controller: controller.userTextController,
                            label: "Username",
                            errorMessage: "Please Enter Username",
                            errorFieldCheck: controller.isUsernameValid.value,
                            prefix: const FaIcon(FontAwesomeIcons.user),
                            obscure: false),
                        renderTextBox(
                            controller: controller.emailTextController,
                            label: "Email",
                            errorMessage: "Please Enter Email",
                            errorFieldCheck: controller.isEmailValid.value,
                            prefix: const FaIcon(FontAwesomeIcons.envelope),
                            obscure: false),
                        renderTextBox(
                            controller: controller.firstNameTextController,
                            label: "First Name",
                            errorMessage: "Please Enter Firstname",
                            errorFieldCheck: controller.isFirstnameValid.value,
                            prefix: const FaIcon(FontAwesomeIcons.user),
                            obscure: false),
                        renderTextBox(
                            controller: controller.lastNameTextController,
                            label: "Last Name",
                            errorMessage: "Please Enter Last Name",
                            errorFieldCheck: controller.isLastNameValid.value,
                            prefix: const FaIcon(FontAwesomeIcons.user),
                            obscure: false),
                        renderButton(
                            onClick: () => controller.updateUser(),
                            label: "Save")
                      ],
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
