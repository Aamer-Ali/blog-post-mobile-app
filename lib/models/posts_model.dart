// To parse this JSON data, do
//
//     final posts = postsFromJson(jsonString);

import 'dart:convert';

List<Posts> postsFromJson(String str) => List<Posts>.from(json.decode(str).map((x) => Posts.fromJson(x)));

String postsToJson(List<Posts> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Posts {
  Posts({
    this.postId,
    this.title,
    this.body,
    this.createdAt,
    this.updatedAt,
    this.userId,
    this.firstName,
    this.lastName,
    this.profilePic,
    this.categoryId,
    this.categoryName,
  });

  int? postId;
  String? title;
  String? body;
  String? createdAt;
  String? updatedAt;
  int? userId;
  String? firstName;
  String? lastName;
  dynamic profilePic;
  int? categoryId;
  String? categoryName;

  factory Posts.fromJson(Map<String, dynamic> json) => Posts(
    postId: json["post_id"],
    title: json["title"],
    body: json["body"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
    userId: json["user_id"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    profilePic: json["profile_pic"],
    categoryId: json["category_id"],
    categoryName: json["category_name"],
  );

  Map<String, dynamic> toJson() => {
    "post_id": postId,
    "title": title,
    "body": body,
    "created_at": createdAt,
    "updated_at": updatedAt,
    "user_id": userId,
    "first_name": firstName,
    "last_name": lastName,
    "profile_pic": profilePic,
    "category_id": categoryId,
    "category_name": categoryName,
  };
}
