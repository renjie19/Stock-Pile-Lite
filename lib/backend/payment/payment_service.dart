import 'package:get_it/get_it.dart';
import 'package:stockpilelite/backend/payment/payment_repostitory.dart';
import 'package:stockpilelite/shared/models/payment.dart';

class PaymentService {
  PaymentRepository _repository = GetIt.I<PaymentRepository>();

  Payment create(Payment payment) {
    return _repository.save(payment);
  }

  Payment update(Payment payment) {
    return _repository.save(payment);
  }

  List<Payment> findAll(int startDate, int endDate) {
    return _repository.findAll(startDate, endDate);
  }

  Payment find(String id) {
    return _repository.find(id);
  }
}