import 'package:hive/hive.dart';
import 'package:stockpilelite/shared/constants/boxes.dart';
import 'package:stockpilelite/shared/models/customer.dart';

class CustomerRepository {
  Box<Customer> _customerBox;

  CustomerRepository(){
    _initialize();
  }

  void _initialize() async {
    Hive.registerAdapter(CustomerAdapter());
    _customerBox = await Hive.openBox<Customer>(Boxes.CUSTOMER);
  }

  Customer save(Customer customer) {
    _customerBox.put(customer.id, customer);
    return customer;
  }

  Customer find(String id) {
    return _customerBox.get(id);
  }

  List<Customer> findAll() {
    return List.from(_customerBox.values);
  }

  List<Customer> findCustomersWithName(String name) {
    return List.from(_customerBox.values.where((customer) => customer.fullName.contains(name)));
  }

  Customer findWithName(String name) {
    return _customerBox.values.firstWhere((customer) => customer.fullName == name, orElse: () => null);
  }

  void delete(String id) {
    Customer customer = find(id);
    customer.delete();
  }

  void deleteAll() {
    _customerBox.clear();
  }
}