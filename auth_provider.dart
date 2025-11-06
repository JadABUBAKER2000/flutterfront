import 'package:flutter/material.dart';
import '../services/local_db_service.dart';
import '../models/user_model.dart';

class AuthProvider extends ChangeNotifier {
  final LocalDbService _db = LocalDbService();
  UserModel? _user;
  bool loading = false;

  UserModel? get user => _user;
  bool get isAuthenticated => _user != null;

  Future<void> init() async {
    final id = await _db.getSessionUserId();
    if (id != null) {
      final db = await _db.database;
      final res = await db.query('users', where: 'id = ?', whereArgs: [id]);
      if (res.isNotEmpty) {
        _user = UserModel.fromMap(res.first);
        notifyListeners();
      }
    }
  }

  Future<String?> signUp(String firstName, String lastName, String email, String password) async {
    loading = true; notifyListeners();
    try {
      final exists = await _db.getUserByEmail(email);
      if (exists != null) return 'Email already used / البريد الإلكتروني مستخدم';
      final id = await _db.createUser(UserModel(firstName: firstName, lastName: lastName, email: email, password: password));
      _user = UserModel(id: id, firstName: firstName, lastName: lastName, email: email, password: ''); // do not expose password
      await _db.saveSession(id);
      return null;
    } catch (e) {
      return 'Sign up failed / فشل التسجيل';
    } finally {
      loading = false; notifyListeners();
    }
  }

  Future<String?> signIn(String email, String password) async {
    loading = true; notifyListeners();
    try {
      final u = await _db.authenticate(email, password);
      if (u == null) return 'Invalid credentials / بيانات غير صحيحة';
      _user = u;
      await _db.saveSession(u.id!);
      return null;
    } catch (e) {
      return 'Sign in failed / فشل تسجيل الدخول';
    } finally {
      loading = false; notifyListeners();
    }
  }

  Future<void> logout() async {
    await _db.clearSession();
    _user = null;
    notifyListeners();
  }

  Future<String?> updateProfile(String firstName, String lastName, String email) async {
    if (_user == null) return 'Not logged in / غير مسجل';
    final newUser = UserModel(id: _user!.id, firstName: firstName, lastName: lastName, email: email, password: _user!.password);
    try {
      await _db.updateUser(newUser);
      _user = newUser;
      notifyListeners();
      return null;
    } catch (e) {
      return 'Update failed / فشل التحديث';
    }
  }
}
