import 'package:hive/hive.dart';
import 'package:stockpilelite/shared/constants/boxes.dart';
import 'package:stockpilelite/shared/models/user.dart';

class UserRepository {
  Box<User> _userBox;

  UserRepository();

  Future initializeBox() async {
    Hive.registerAdapter(UserAdapter());
    this._userBox = await Hive.openBox<User>(Boxes.USER);
  }

  User save(User user) {
    this._userBox.put(user.id, user);
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

  void deleteAll() {
    _userBox.clear();
  }
}
