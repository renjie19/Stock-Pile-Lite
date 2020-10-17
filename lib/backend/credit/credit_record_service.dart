import 'package:get_it/get_it.dart';
import 'package:stockpilelite/backend/credit/credit_repository.dart';
import 'package:stockpilelite/shared/models/credit_record.dart';

class CreditRecordService {
  CreditRepository _repository = GetIt.I<CreditRepository>();

  CreditRecord create(CreditRecord creditRecord) {
    var foundRecord = _repository.findByCustomerId(creditRecord.customer.id);
    throwIf(foundRecord != null, Exception('Customer already has an existing record'));
    return _repository.save(creditRecord);
  }

  CreditRecord update(CreditRecord creditRecord) {
    find(creditRecord.id);
    return _repository.save(creditRecord);
  }

  CreditRecord find(String id) {
    CreditRecord foundRecord = _repository.find(id);
    throwIf(foundRecord == null, Exception('Record does not exist'));
    return foundRecord;
  }

  CreditRecord findByCustomerId(String customerId) {
    CreditRecord foundRecord = _repository.findByCustomerId(customerId);
    throwIf(foundRecord == null, Exception('Customer has no pending record'));
    return foundRecord;
  }

  List<CreditRecord> findAll(String status) {
    if (status.isEmpty) status = 'PARTIAL';
    return _repository.findAll(status);
  }
}