import 'package:hive/hive.dart';
import 'package:stockpilelite/shared/commons/models/base_model.dart';
import 'package:stockpilelite/shared/commons/models/customer.dart';
part '../adapters/credit_record.g.dart';

@HiveType(typeId: 8)
class CreditRecord extends BaseModel {
  @HiveField(6)
  Customer customer;
  @HiveField(7)
  double totalAmount;
  @HiveField(8)
  double amountPaid;
  @HiveField(9)
  String paymentStatus;
  @HiveField(10)
  double transferredAmount;
// TODO: items
// TODO: payment

  CreditRecord(
      id,
      dateCreated,
      dateModified,
      createdBy,
      modifiedBy,
      active,
      this.customer,
      this.totalAmount,
      this.amountPaid,
      this.paymentStatus,
      this.transferredAmount)
      : super(id: id, dateCreated: dateCreated, dateModified: dateModified, createdBy:createdBy, modifiedBy:modifiedBy, active:active);

  CreditRecord.instance();
}
