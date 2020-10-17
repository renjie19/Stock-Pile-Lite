import 'package:hive/hive.dart';
import 'package:stockpilelite/shared/constants/boxes.dart';
import 'package:stockpilelite/shared/models/payment.dart';

class PaymentRepository {
  Box<Payment> _paymentBox;

  PaymentRepository() {
    _initialize();
  }

  void _initialize() async {
    Hive.registerAdapter(PaymentAdapter());
    _paymentBox = await Hive.openBox(Boxes.PAYMENT);
  }

  Payment save(Payment payment) {
    _paymentBox.put(payment.id, payment);
    return payment;
  }

  Payment find(String id) {
    return _paymentBox.get(id);
  }

  List<Payment> findAll(int startDate, int endDate) {
    return List.from(_paymentBox.values.where((payment) =>
        payment.dateCreated >= startDate && payment.dateCreated <= endDate));
  }
}
