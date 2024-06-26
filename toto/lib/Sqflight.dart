import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper.internal();

  factory DatabaseHelper() => _instance;

  static Database? _db;

  Future<Database> get db async {
    if (_db != null) {
      return _db!;
    }
    _db = await initDb();
    return _db!;
  }

  DatabaseHelper.internal();

  Future<Database> initDb() async {
    String databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'notes.db');

    // Open/create the database at a given path
    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  void _onCreate(Database db, int newVersion) async {
    await db.execute('''
      CREATE TABLE notes (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        home TEXT,
        customerName TEXT,
        deliveryAddress TEXT,
        phoneNo TEXT,
        date TEXT,
        time TEXT
      )
    ''');
  }

  Future<int> insertOrder(Map<String, dynamic> order) async {
    var dbClient = await db;
    int res = await dbClient.insert('notes', order);
    return res;
  }

  Future<List<Map<String, dynamic>>> getOrders() async {
    var dbClient = await db;
    var res = await dbClient.query('notes');
    return res.isNotEmpty ? res.toList() : [];
  }

  Future<int> updateOrder(int id, Map<String, dynamic> order) async {
    var dbClient = await db;
    return await dbClient.update('notes', order, where: 'id = ?', whereArgs: [id]);
  }

  Future<int> deleteOrder(int id) async {
    var dbClient = await db;
    return await dbClient.delete('notes', where: 'id = ?', whereArgs: [id]);
  }
}
