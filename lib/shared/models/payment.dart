import 'package:hive/hive.dart';
import 'package:stockpilelite/shared/models/base_model.dart';
part '../adapters/payment.g.dart';

@HiveType(typeId: 10)
class Payment extends BaseModel {
  @HiveField(6)
  double amount; // current amount to pay on record before the payment
  @HiveField(7)
  String paidBy;
  @HiveField(8)
  String receivedBy;
  @HiveField(9)
  double change; // change from amount and received amount
  @HiveField(10)
  double receivedAmount; // amount received from payee

  Payment(
      id,
      dateCreated,
      dateModified,
      createdBy,
      modifiedBy,
      active,
      this.amount,
      this.paidBy,
      this.receivedBy,
      this.change,
      this.receivedAmount)
      : super(id: id, dateCreated: dateCreated, dateModified: dateModified, createdBy:createdBy, modifiedBy:modifiedBy, active:active);

  Payment.instance();
}
