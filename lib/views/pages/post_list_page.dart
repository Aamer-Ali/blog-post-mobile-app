import 'package:blog_post/controllers/post_list_controller.dart';
import 'package:blog_post/routes/routing_constants.dart';
import 'package:blog_post/views/common_widgets/no_data_found_view.dart';
import 'package:blog_post/views/common_widgets/progress_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class PostListPage extends StatefulWidget {
  const PostListPage({Key? key}) : super(key: key);

  @override
  _PostListPageState createState() => _PostListPageState();
}

class _PostListPageState extends State<PostListPage> {
  final controller = Get.put(PostListController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Obx(
          () => controller.isDataLoading.value
              ? ProgressView(message: "Loading....")
              : controller.isDataFound.value
                  ? listOfPost()
                  : NoDataFound(message: "No Post Found Please Try Again"),
        ),
      ),
    );
  }

  Widget listOfPost() {
    return ListView.builder(
        itemCount: controller.posts.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Card(
                  elevation: 10,
                  child: ListTile(
                    onTap: () {
                      // print(controller.posts[index].postId);
                      // Navigator.pushNamed(context, "/post_details",arguments: controller.posts[index].postId);
                      Navigator.pushNamed(context, PostDetailsPageRoute,arguments: controller.posts[index].postId);
                    },
                    leading: controller.posts[index].profilePic == null
                        ? SvgPicture.asset(
                            'assets/images/avatar.svg',
                            width: Get.width / 12,
                          )
                        : Image.network(
                            controller.posts[index].profilePic,
                            width: Get.width / 12,
                          ),
                    title: Text(controller.posts[index].title!),
                    subtitle: Text(
                        "${controller.posts[index].body.toString().substring(0, 150)}...."),
                  ),
                ),
                // Divider(
                //   endIndent: Get.width / 3,
                //   indent: Get.width / 3,
                //   color: Colors.black,
                //   thickness: 2.0,
                // ),
              ],
            ),
          );
        });
  }
}
