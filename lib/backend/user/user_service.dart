import 'package:get_it/get_it.dart';
import 'package:stockpilelite/backend/user/user_repository.dart';
import 'package:stockpilelite/shared/models/user.dart';

class UserService {
  UserRepository _userRepository = GetIt.I<UserRepository>();

  create(User user) {
    var foundUser = _userRepository.findWithName(user.fullName);
    throwIf(foundUser != null, Exception('User with name already exists'));
    _userRepository.save(user);
    return user;
  }

  delete(User user) {
    _userRepository.delete(user);
  }

  find(String id) {
    var foundUser = _userRepository.find(id);
    throwIf(foundUser == null, Exception('User does not exist'));
    return foundUser;
  }

  findAll() {
    return _userRepository.findAll();
  }

  toggleStatus(String id) {
    var user = this.find(id);
    user.active = !user.active;
    _userRepository.save(user);
    return user;
  }

  update(User user) {
    this.find(user.id);
    return _userRepository.save(user);
  }

  void deleteAll() {
    _userRepository.deleteAll();
  }
}
