import 'package:hive/hive.dart';
import 'package:stockpilelite/shared/models/base_model.dart';
import 'package:stockpilelite/shared/models/customer.dart';
import 'package:stockpilelite/shared/models/user.dart';
part '../adapters/user_profile.g.dart';

@HiveType(typeId: 3)
class UserProfile extends BaseModel {
  @HiveField(6)
  User user;
  @HiveField(7)
  String username;
  @HiveField(8)
  String password;

  UserProfile(id, dateCreated, dateModified, createdBy, modifiedBy, active,
      this.user, this.username, this.password)
      : super(id: id, dateCreated: dateCreated, dateModified: dateModified, createdBy:createdBy, modifiedBy:modifiedBy, active:active);

  UserProfile.instance();
  UserProfile.from(User user, String username, String password) {
    this.user = user;
    this.username = username;
    this.password = password;
  }
}
