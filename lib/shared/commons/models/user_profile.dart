import 'package:hive/hive.dart';
import 'package:stockpilelite/shared/commons/models/base_model.dart';
part '../adapters/user_profile.g.dart';

@HiveType(typeId: 3)
class UserProfile extends BaseModel {
  @HiveField(6)
  int userId;
  @HiveField(7)
  String userName;
  @HiveField(8)
  String lastName;

  UserProfile(id, dateCreated, dateModified, createdBy, modifiedBy, active,
      this.userId, this.userName, this.lastName)
      : super(id: id, dateCreated: dateCreated, dateModified: dateModified, createdBy:createdBy, modifiedBy:modifiedBy, active:active);

  UserProfile.instance();
}
