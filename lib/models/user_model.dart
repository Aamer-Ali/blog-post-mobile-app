import 'dart:convert';

const String tableUser = 'users';

class UserFields {
  static final List<String> values = [
    id,
    userName,
    firstName,
    lastName,
    email,
    profilePic
  ];

  static const String id = '_id';
  static const String userName = 'userName';
  static const String firstName = 'firstName';
  static const String lastName = 'lastName';
  static const String email = 'email';
  static const String profilePic = 'profilePic';
}

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel._init();

  UserModel({
    this.id,
    this.name,
    this.firstName,
    this.lastName,
    this.email,
    this.profilePic,
  });

  int? id;
  String? name;
  String? firstName;
  String? lastName;
  String? email;
  dynamic profilePic;

  UserModel copy({
    int? id,
    String? userName,
    String? firstName,
    String? lastName,
    String? email,
    String? profilePic,
  }) =>
      UserModel(
          id: id ?? this.id,
          name: userName ?? this.name,
          firstName: firstName ?? this.firstName,
          lastName: lastName ?? this.lastName,
          email: email ?? this.email,
          profilePic: profilePic ?? this.profilePic);

  Map<String, Object?> toJsonForDatabase() => {
        UserFields.id: id,
        UserFields.userName: name,
        UserFields.firstName: firstName,
        UserFields.lastName: lastName,
        UserFields.email: email,
        UserFields.profilePic: profilePic
      };

  static UserModel fromJsonForDatabase(Map<String, Object?> json) => UserModel(
      id: json[UserFields.id] as int,
      name: json[UserFields.userName] as String,
      firstName: json[UserFields.firstName] as String,
      lastName: json[UserFields.lastName] as String,
      email: json[UserFields.email] as String,
      profilePic: json[UserFields.profilePic] as String);

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        name: json["name"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        email: json["email"],
        profilePic: json["profile_pic"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "profile_pic": profilePic,
      };
}
