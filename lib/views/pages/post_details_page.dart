import 'package:blog_post/controllers/post_details_controller.dart';
import 'package:blog_post/views/common_widgets/progress_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class PostDetailsPage extends StatefulWidget {
  final postId;

  const PostDetailsPage({Key? key, required this.postId}) : super(key: key);

  @override
  _PostDetailsPageState createState() => _PostDetailsPageState(postId: postId);
}

class _PostDetailsPageState extends State<PostDetailsPage> {
  final postId;

  _PostDetailsPageState({required this.postId});

  final controller = Get.put(PostDetailsController());
  int id = 0;

  @override
  void initState() {
    super.initState();
    controller.getPostById(postId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Post-Details"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Obx(() => controller.isDataLoading.value
              ? ProgressView(message: "Please Wait")
              : Card(
                  elevation: 10,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      leading: controller.post.value.profilePic == null
                          ? SvgPicture.asset(
                              'assets/images/avatar.svg',
                              width: Get.width / 12,
                            )
                          : Image.network(
                              controller.post.value.profilePic,
                              width: Get.width / 12,
                            ),
                      title: Text(controller.post.value.title!),
                      subtitle: Text(controller.post.value.body!),
                    ),
                  ),
                )),
        ),
      ),
    );
  }

  void getArguments() {
    try {
      id = ModalRoute.of(context)!.settings.arguments as int;
    } catch (ex) {
      print(ex);
    }
  }
}
