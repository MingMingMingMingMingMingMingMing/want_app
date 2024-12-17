import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:want_front/models/wishlist_item.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;

  static Database? _database;

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'wishlist.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE wishlist(id TEXT PRIMARY KEY, title TEXT, price REAL, purchaseSite TEXT, description TEXT, status TEXT)',
        );
      },
    );
  }

  Future<void> insertWishlistItem(WishlistItem item) async {
    final db = await database;
    await db.insert(
      'wishlist',
      item.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<WishlistItem>> getWishlistItems() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('wishlist');

    return List.generate(maps.length, (i) {
      return WishlistItem.fromMap(maps[i]);
    });
  }

  Future<void> deleteWishlistItem(String id) async {
    final db = await database;
    await db.delete(
      'wishlist',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
