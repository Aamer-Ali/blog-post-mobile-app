import 'package:blog_post/models/user_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class BlogPostDatabase {
  static final BlogPostDatabase instance = BlogPostDatabase._init();
  static Database? _database;

  BlogPostDatabase._init();

  Future<Database?> get database async {
    if (_database != null) return _database!;
    _database = await _initDB("blog_postDb.db");
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    // final idType = "INTEGER PRIMARY KEY AUTOINCREMENT";
    const idType = "INTEGER PRIMARY KEY";
    const textTypeNotNull = "TEXT NOT NULL";
    const textTypeNull = "TEXT ";

    await db.execute('''
      CREATE TABLE $tableUser(
      ${UserFields.id} $idType,
      ${UserFields.userName} $textTypeNotNull,
      ${UserFields.firstName} $textTypeNotNull,
      ${UserFields.lastName} $textTypeNotNull,
      ${UserFields.email} $textTypeNotNull,
      ${UserFields.profilePic} $textTypeNull
      );
      ''');
  }

  Future close() async {
    final db = await instance.database;
    db!.close();
  }
}
