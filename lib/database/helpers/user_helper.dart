import 'package:blog_post/database/blog_post_database.dart';
import 'package:blog_post/models/user_model.dart';

class UserHelper {
  static Future<UserModel> createUser(UserModel user) async {
    final db = await BlogPostDatabase.instance.database;
    final id = await db!.insert(tableUser, user.toJsonForDatabase());
    return user.copy(id: id);
  }

  static Future<UserModel> readUser(int id) async {
    final db = await BlogPostDatabase.instance.database;
    final map = await db!.query(tableUser,
        columns: UserFields.values,
        where: "${UserFields.id} = ?",
        whereArgs: [id]);

    if (map.isNotEmpty) {
      return UserModel.fromJsonForDatabase(map.first);
    } else {
      throw Exception('ID $id is not found');
    }
  }

  static Future<List<UserModel>> raedAllUser() async {
    final db = await BlogPostDatabase.instance.database;
    final result = await db!.query(tableUser);
    return result.map((json) => UserModel.fromJsonForDatabase(json)).toList();
  }

  static Future<int> updateUser(UserModel user) async {
    final db = await BlogPostDatabase.instance.database;
    return db!.update(tableUser, user.toJsonForDatabase(),
        where: "${UserFields.id} = ?", whereArgs: [user.id]);
  }

  static Future<int> deleteUser(int id) async {
    final db = await BlogPostDatabase.instance.database;
    return db!
        .delete(tableUser, where: "${UserFields.id} = ?", whereArgs: [id]);
  }
}
