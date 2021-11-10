import 'dart:async';
import 'dart:convert';
import 'package:blog_post/database/helpers/user_helper.dart';
import 'package:blog_post/models/posts_model.dart';
import 'package:blog_post/models/user_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:jwt_decoder/jwt_decoder.dart';

class HttpServicesProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<List<Posts>> getAllPosts() async {
    try {
      var response =
          await http.get(Uri.parse("http://127.0.0.1:3000/api/posts"));
      var jsonData = response.body;
      return postsFromJson(jsonData);
    } catch (ex) {
      throw ex;
    }
  }

  Future<Posts> getPostById(int id) async {
    try {
      var response =
          await http.get(Uri.parse("http://127.0.0.1:3000/api/posts/${id}"));
      return Posts.fromJson(jsonDecode(response.body));
    } catch (ex) {
      throw ex;
    }
  }

  Future<UserModel> updateUser(int id, Map reqBody) async {
    try {
      var response = await http.put(
          Uri.parse("http://127.0.0.1:3000/api/users/${id}"),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode(reqBody));
      var jsonData = jsonDecode(response.body);
      Map<String, dynamic> decodedToken = JwtDecoder.decode(jsonData["data"]);
      UserModel userModel = UserModel(
          id: decodedToken["id"],
          name: decodedToken["name"],
          firstName: decodedToken["first_name"],
          lastName: decodedToken["last_name"],
          email: decodedToken["email"],
          profilePic: decodedToken["profile_pic"]);
      UserHelper.updateUser(userModel);
      return userModel;
    } catch (ex) {
      throw ex;
    }
  }

  Future<UserModel?> loginUser(Map reqBody) async {
    try {
      var response = await http.post(
          Uri.parse("http://127.0.0.1:3000/api/users/login"),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode(reqBody));
      var jsonData = jsonDecode(response.body);
      Map<String, dynamic> decodedToken = JwtDecoder.decode(jsonData["data"]);

      var user = UserModel(
          id: decodedToken["id"],
          name: decodedToken["name"],
          firstName: decodedToken["first_name"],
          lastName: decodedToken["last_name"],
          email: decodedToken["email"],
          profilePic: decodedToken["profile_pic"]);

      if (jsonData["status"] != true) return null;
      return user;
    } catch (ex) {
      throw ex;
    }
  }
}
