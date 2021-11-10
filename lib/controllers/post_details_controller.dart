import 'package:blog_post/models/posts_model.dart';
import 'package:blog_post/services/http_services_provider.dart';
import 'package:get/get.dart';

class PostDetailsController extends GetxController {
  var post = Rx(Posts());
  var isDataLoading = true.obs;
  var isDataFound = false.obs;

  void getPostById(int id) {
    isDataLoading.value = true;
    HttpServicesProvider().getPostById(id).then((responsePosts) {
      isDataLoading.value = false;
      post.value = responsePosts;
    }).catchError((err) {
      isDataLoading.value = false;
      isDataFound.value = false;
    });
  }
}
