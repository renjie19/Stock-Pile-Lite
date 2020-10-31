import 'package:hive/hive.dart';
import 'package:stockpilelite/shared/constants/boxes.dart';
import 'package:stockpilelite/shared/constants/payment_status.dart';
import 'package:stockpilelite/shared/models/credit_item.dart';
import 'package:stockpilelite/shared/models/credit_record.dart';

class CreditRepository {
  Box<CreditRecord> _creditBox;

  CreditRepository();

  Future initialize() async {
    Hive.registerAdapter(CreditRecordAdapter());
    Hive.registerAdapter(CreditItemAdapter());
    _creditBox = await Hive.openBox(Boxes.CREDIT_RECORD);
  }

  CreditRecord save(CreditRecord creditRecord) {
    _creditBox.put(creditRecord.id, creditRecord);
    return creditRecord;
  }

  CreditRecord find(String id) {
    return _creditBox.get(id);
  }

  List<CreditRecord> findAll(String status) {
    return _creditBox.values.where((creditRecord) =>
        creditRecord.paymentStatus == status ||
        creditRecord.paymentStatus == PaymentStatus.UNPAID);
  }

  CreditRecord findByCustomerId(String customerId) {
    return _creditBox.values.firstWhere(
        (creditRecord) =>
            creditRecord.customer.id == customerId &&
            creditRecord.paymentStatus == 'PAID',
        orElse: () => null);
  }

  void delete(String id) {
    _creditBox.delete(id);
  }
}
