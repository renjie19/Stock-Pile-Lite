import 'package:hive/hive.dart';
import 'package:stockpilelite/shared/commons/constants/boxes.dart';
import 'package:stockpilelite/shared/commons/models/user.dart';

class UserRepository {
  Box<User> _userBox;

  UserRepository() {
    _initializeBox();
  }

  _initializeBox() async {
    Hive.registerAdapter(UserAdapter());
    this._userBox = await Hive.openBox<User>(Boxes.USER);
  }

  User save(User user) {
    var result = this._userBox.get(user.id);
    if (result == null) {
      this._userBox.put(user.id, user);
    } else {
      user.save();
    }
    return user;
  }

  void delete(User user) {
    user.delete();
  }

  User find(String id) {
    return this._userBox.get(id);
  }

  List<User> findAll() {
    return List.from(this._userBox.values);
  }

  User findWithName(String name) {
    return this
        ._userBox
        .values
        .firstWhere((user) => user.fullName == name, orElse: () => null);
  }
}
