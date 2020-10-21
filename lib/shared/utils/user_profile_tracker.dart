import 'package:shared_preferences/shared_preferences.dart';

class UserProfileTracker {
  SharedPreferences _preferences;

  UserProfileTracker() {
    _initialize();
  }

  Future<void> _initialize() async {
    _preferences = await SharedPreferences.getInstance();
  }

   String get user {
    return _preferences.getString('user');
  }

  setUser(String user) {
    _preferences.setString('user', user);
  }

  startSession() {
    _preferences.setInt('session', DateTime.now().millisecondsSinceEpoch);
  }

  int get session {
    return _preferences.getInt('session');
  }

  bool get isSessionExpired {
    if (_preferences.getInt('session') == null) {
      return true;
    }
    var session = DateTime.fromMillisecondsSinceEpoch(_preferences.getInt('session'));
    var now = DateTime.now();
    return DateTime(session.year, session.month, session.day).difference(DateTime(now.year, now.month, now.day)).isNegative;
  }

  void endSession() {
    _preferences.setString('user', null);
    _preferences.setInt('session', null);
  }
}