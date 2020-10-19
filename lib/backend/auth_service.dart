import 'package:get_it/get_it.dart';
import 'package:stockpilelite/backend/user_profile/user_profile_repository.dart';
import 'package:stockpilelite/shared/models/user_profile.dart';
import 'package:stockpilelite/shared/utils/user_profile_tracker.dart';

class AuthService {
  UserProfileRepository _userProfileRepository = GetIt.I<UserProfileRepository>();
  UserProfileTracker _userProfileTracker = GetIt.I<UserProfileTracker>();

  AuthService();

  login(String username, String password) {
    UserProfile foundProfile = _userProfileRepository.findWithUserNamePassword(username, password);
    throwIf(foundProfile == null, Exception('Username and Password does not exist'));
    _userProfileTracker.setUser(foundProfile.username);
    _userProfileTracker.startSession();
  }

  logOut() {
    _userProfileTracker.endSession();
  }
}