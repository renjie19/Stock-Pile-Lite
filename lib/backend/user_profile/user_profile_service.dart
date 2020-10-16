import 'package:get_it/get_it.dart';
import 'package:stockpilelite/backend/user_profile/user_profile_repository.dart';
import 'package:stockpilelite/shared/models/user_profile.dart';

class UserProfileService {
  UserProfileRepository _repository = GetIt.I<UserProfileRepository>();

  UserProfile create(UserProfile profile) {
    UserProfile foundProfile = _repository.findWithUserNamePassword(
        profile.username, profile.password);
    throwIf(
        foundProfile != null, Exception('username and password already taken'));
    return this._repository.save(profile);
  }

  UserProfile update(UserProfile profile) {
    find(profile.id);
    return this._repository.save(profile);
  }

  UserProfile find(String id) {
    UserProfile foundProfile = this._repository.find(id);
    throwIf(foundProfile == null, Exception('Profile does not exist'));
    return foundProfile;
  }

  List<UserProfile> findAll() {
    return this._repository.findAll();
  }

  void delete(String id) {
    this._repository.delete(id);
  }

  UserProfile toggleStatus(String id) {
    UserProfile foundProfile = find(id);
    foundProfile.active = !foundProfile.active;
    return foundProfile;
  }
  void deleteAll() {
    _repository.deleteAll();
  }
}
