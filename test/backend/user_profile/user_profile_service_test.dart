import 'package:flutter_driver/driver_extension.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:stockpilelite/backend/user/user_repository.dart';
import 'package:stockpilelite/backend/user/user_service.dart';
import 'package:stockpilelite/backend/user_profile/user_profile_repository.dart';
import 'package:stockpilelite/backend/user_profile/user_profile_service.dart';
import 'package:stockpilelite/shared/models/user.dart';
import 'package:stockpilelite/shared/models/user_profile.dart';
import 'package:stockpilelite/stock_pile_lite.dart';

void main() async {
  enableFlutterDriverExtension();
  await StockPileLite.initialize();

  UserService userService = GetIt.I<UserService>();
  UserProfileService userProfileService = GetIt.I<UserProfileService>();

  UserProfile getUserProfile() {
    User user = User.instance();
    user.createdBy = 'admin';
    user.modifiedBy = 'admin';
    user.firstName = 'John Lourence';
    user.lastName = 'Gania';
    user.birthday = 885139200000; // January 19, 1998
    user.age = 22;
    user.dateCreated = 1602259200000;
    user.dateModified = 1602259200000;
    userService.create(user);

    UserProfile userProfile = UserProfile.instance();
    userProfile.user = user;
    userProfile.username = 'username';
    userProfile.password = 'password';
    return userProfile;
  }

  test('create', () {
    UserProfile userProfile = getUserProfile();
    UserProfile savedProfile;
    try {
      savedProfile = userProfileService.create(userProfile);
      expect(savedProfile.user, userProfile.user);
      expect(savedProfile.username, userProfile.username);
      expect(savedProfile.password, userProfile.password);
    } finally {
      userProfile.user.delete();
      savedProfile.delete();
    }
  });

  test('update', () {
    UserProfile userProfile = getUserProfile();
    UserProfile savedProfile;
    try {
      savedProfile = userProfileService.create(userProfile);
      savedProfile.password = 'updatedPassword';
      UserProfile updatedProfile = userProfileService.update(savedProfile);
      expect(updatedProfile.password, 'updatedPassword');
    }finally {
      savedProfile.delete();
      savedProfile.user.delete();
    }
  });

  test('find', () {
    UserProfile userProfile = getUserProfile();
    UserProfile savedProfile;
    try {
      savedProfile = userProfileService.create(userProfile);
      expect(userProfileService.find(savedProfile.id), savedProfile);
    } finally {
      savedProfile.delete();
    }
  });
}