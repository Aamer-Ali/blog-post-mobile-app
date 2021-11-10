import 'package:blog_post/models/posts_model.dart';
import 'package:blog_post/services/http_services_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PostListController extends GetxController {
  List<Posts> posts = RxList<Posts>();
  var isDataLoading = true.obs;
  var isDataFound = false.obs;

  @override
  void onInit() {
    super.onInit();
    getData();
  }

  void getData() {
    isDataLoading.value = true;
    HttpServicesProvider().getAllPosts().then((responsePosts) {
      isDataLoading.value = false;
      if (responsePosts.length != 0) {
        isDataFound.value = true;
        posts.addAll(responsePosts);
      } else {
        isDataFound.value = false;
      }
    }).catchError((err) {
      isDataLoading.value = false;
      isDataFound.value = false;
    });
  }
}
