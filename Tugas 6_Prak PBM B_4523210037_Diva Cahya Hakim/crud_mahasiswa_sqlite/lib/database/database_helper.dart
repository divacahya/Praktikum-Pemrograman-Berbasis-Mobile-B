import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();

  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('mahasiswa.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
    );
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE mahasiswa (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        nama TEXT,
        ttl TEXT,
        jenisKelamin TEXT,
        alamat TEXT,
        agama TEXT,
        pendidikan TEXT,
        noHp TEXT,
        email TEXT
      )
    ''');
  }

  Future<int> insertMahasiswa(Map<String, dynamic> data) async {
    final db = await instance.database;
    return await db.insert('mahasiswa', data);
  }

  Future<List<Map<String, dynamic>>> getMahasiswa() async {
    final db = await instance.database;
    return await db.query('mahasiswa');
  }

  Future<int> updateMahasiswa(
      int id,
      Map<String, dynamic> data,
      ) async {
    final db = await instance.database;

    return await db.update(
      'mahasiswa',
      data,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<int> deleteMahasiswa(int id) async {
    final db = await instance.database;

    return await db.delete(
      'mahasiswa',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}