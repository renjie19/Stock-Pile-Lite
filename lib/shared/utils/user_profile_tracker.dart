import 'package:shared_preferences/shared_preferences.dart';

class UserProfileTracker {
  SharedPreferences _preferences;

  UserProfileTracker() {
    _initialize();
  }

  _initialize() async {
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
    return DateTime.now().isAfter(DateTime.fromMicrosecondsSinceEpoch(_preferences.getInt('session')));
  }

  void endSession() {
    _preferences.setString('user', null);
    _preferences.setInt('session', null);
  }
}