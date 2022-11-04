import 'package:jop_task/features/auth/data/models/user_model.dart';

class CurrentUser {
  static UserModel? _currentUser;
  static String? _token;
  static void setUser(UserModel user) {
    _currentUser = user;
  }

  static UserModel? getUser() => _currentUser;

  static void setToken(String token) {
    _token = token;
  }

  static String? getToken() => _token;

  static void clear() {
    _currentUser = null;
    _token = null;
  }
}
