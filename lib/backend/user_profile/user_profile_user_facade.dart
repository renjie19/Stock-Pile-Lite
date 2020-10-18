import 'package:get_it/get_it.dart';
import 'package:stockpilelite/backend/user/user_service.dart';
import 'package:stockpilelite/backend/user_profile/user_profile_service.dart';
import 'package:stockpilelite/shared/models/user.dart';
import 'package:stockpilelite/shared/models/user_profile.dart';

class UserProfileUserFacade {
  final UserService _userService = GetIt.I<UserService>();
  final UserProfileService _userProfileService = GetIt.I<UserProfileService>();

  create(User user, String username, String password) {
    _userService.create(user);
    _userProfileService.create(UserProfile.from(user, username, password));
  }
}