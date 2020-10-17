import 'package:get_it/get_it.dart';
import 'package:stockpilelite/backend/customer/customer_repository.dart';
import 'package:stockpilelite/shared/models/customer.dart';

class CustomerService {
  CustomerRepository _repository = GetIt.I<CustomerRepository>();

  Customer create(Customer customer) {
    Customer foundCustomer = _repository.findWithName(customer.fullName);
    throwIf(foundCustomer != null, Exception('Customer with name already exists'));
    return _repository.save(customer);
  }

  Customer update(Customer customer) {
    find(customer.id);
    return _repository.save(customer);
  }

  Customer find(String id) {
    Customer foundCustomer = _repository.find(id);
    throwIf(foundCustomer == null, Exception('Customer does not exist'));
    return foundCustomer;
  }

  List<Customer> findAll(){
    return _repository.findAll();
  }

  void delete(String id) {
    find(id);
    return _repository.delete(id);
  }

  void deleteAll() {
    _repository.deleteAll();
  }
}