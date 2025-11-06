import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../models/user_model.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:crypto/crypto.dart';
import 'dart:convert';

class LocalDbService {
  static final LocalDbService _instance = LocalDbService._internal();
  factory LocalDbService() => _instance;
  LocalDbService._internal();

  Database? _db;

  Future<Database> get database async {
    if (_db != null) return _db!;
    _db = await _initDB('unibook.db');
    return _db!;
  }

  Future<Database> _initDB(String fileName) async {
    final dir = await getApplicationDocumentsDirectory();
    final path = join(dir.path, fileName);
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  FutureOr<void> _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE users (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        firstName TEXT NOT NULL,
        lastName TEXT NOT NULL,
        email TEXT NOT NULL UNIQUE,
        password TEXT NOT NULL
      )
    ''');
    await db.execute('''
      CREATE TABLE session (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        userId INTEGER
      )
    ''');
  }

  // helper: hash password using SHA-256
  String hashPassword(String password) {
    final bytes = utf8.encode(password);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }

  // Create user (password will be hashed)
  Future<int> createUser(UserModel user) async {
    final db = await database;
    final hashed = hashPassword(user.password);
    final map = {
      'firstName': user.firstName,
      'lastName': user.lastName,
      'email': user.email,
      'password': hashed,
    };
    return await db.insert('users', map);
  }

  // Get user by email
  Future<UserModel?> getUserByEmail(String email) async {
    final db = await database;
    final res = await db.query('users', where: 'email = ?', whereArgs: [email]);
    if (res.isEmpty) return null;
    return UserModel.fromMap(res.first);
  }

  // Authenticate (email + password) - hashes input and compares
  Future<UserModel?> authenticate(String email, String password) async {
    final db = await database;
    final hashed = hashPassword(password);
    final res = await db.query('users', where: 'email = ? AND password = ?', whereArgs: [email, hashed]);
    if (res.isEmpty) return null;
    return UserModel.fromMap(res.first);
  }

  // Save session (simple)
  Future<void> saveSession(int userId) async {
    final db = await database;
    await db.delete('session');
    await db.insert('session', {'userId': userId});
  }

  Future<int?> getSessionUserId() async {
    final db = await database;
    final res = await db.query('session', limit: 1);
    if (res.isEmpty) return null;
    return res.first['userId'] as int?;
  }

  Future<void> clearSession() async {
    final db = await database;
    await db.delete('session');
  }

  Future<void> updateUser(UserModel user) async {
    final db = await database;
    // if password field is already hashed (length 64 hex), keep it; otherwise hash it
    String pwd = user.password;
    if (pwd.length != 64 || !RegExp(r'^[a-f0-9]{64}\$').hasMatch(pwd)) {
      pwd = hashPassword(pwd);
    }
    await db.update('users', {
      'firstName': user.firstName,
      'lastName': user.lastName,
      'email': user.email,
      'password': pwd,
    }, where: 'id = ?', whereArgs: [user.id]);
  }
}
