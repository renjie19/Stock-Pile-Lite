import 'package:hive/hive.dart';
import 'package:stockpilelite/shared/models/base_model.dart';
part '../adapters/user.g.dart';

@HiveType(typeId: 2)
class User extends BaseModel {
  @HiveField(6)
  String firstName;
  @HiveField(7)
  String lastName;
  @HiveField(8)
  int birthday;
  @HiveField(9)
  int age;

  User( id, dateCreated, dateModified, createdBy, modifiedBy, active, this.firstName, this.lastName, this.birthday, this.age)
      : super(id: id, dateCreated: dateCreated, dateModified: dateModified, createdBy:createdBy, modifiedBy:modifiedBy, active:active);

  User.instance();

  String get fullName {
    return '${this.firstName} ${this.lastName}';
  }

  String get birthDateInDateString {
    // TODO: format birthday to String MMMM dd, YYYY
    return '';
  }
}

