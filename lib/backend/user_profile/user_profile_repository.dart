import 'package:hive/hive.dart';
import 'package:stockpilelite/shared/constants/boxes.dart';
import 'package:stockpilelite/shared/models/user_profile.dart';

class UserProfileRepository {
  Box<UserProfile> _userProfileBox;

  UserProfileRepository() {
    _initializeBox();
  }

  _initializeBox() async {
    this._userProfileBox = await Hive.openBox<UserProfile>(Boxes.USER_PROFILE);
  }

  UserProfile save(UserProfile profile) {
    UserProfile userProfile = this._userProfileBox.get(profile.id);
    if (userProfile == null) {
      this._userProfileBox.add(profile);
    } else {
      profile.save();
    }
    return profile;
  }

  UserProfile find(String id) {
    return this
        ._userProfileBox
        .values
        .firstWhere((profile) => profile.id == id, orElse: () => null);
  }

  List<UserProfile> findAll() {
    return List.from(this._userProfileBox.values);
  }

  void delete(String id) {
    UserProfile profile = find(id);
    if (profile != null) {
      profile.delete();
    }
  }

  UserProfile findWithUserNamePassword(String username, String password) {
    return this._userProfileBox.values.firstWhere(
        (profile) =>
            profile.username == username && profile.password == password,
        orElse: () => null);
  }
}
