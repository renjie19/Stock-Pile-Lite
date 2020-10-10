import 'package:hive/hive.dart';
import 'package:stockpilelite/shared/commons/models/base_model.dart';
part '../adapters/customer.g.dart';

@HiveType(typeId: 7)
class Customer extends BaseModel {
  @HiveField(6)
  String firstName;
  @HiveField(7)
  String lastName;
  @HiveField(8)
  String address;
  @HiveField(9)
  int birthDate;
  @HiveField(10)
  int age;
  @HiveField(11)
  String contactNumber;
  @HiveField(12)
  String coMaker;
  @HiveField(13)
  String coMakerContactNumber;
// TODO: add field for image file

  Customer(
      id,
      dateCreated,
      dateModified,
      createdBy,
      modifiedBy,
      active,
      this.firstName,
      this.lastName,
      this.address,
      this.birthDate,
      this.age,
      this.contactNumber,
      this.coMaker,
      this.coMakerContactNumber)
      : super(id: id, dateCreated: dateCreated, dateModified: dateModified, createdBy:createdBy, modifiedBy:modifiedBy, active:active);

  Customer.instance();
}
