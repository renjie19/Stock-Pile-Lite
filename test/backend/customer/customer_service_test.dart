import 'package:flutter_driver/driver_extension.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:stockpilelite/backend/customer/customer_service.dart';
import 'package:stockpilelite/shared/models/customer.dart';
import 'package:stockpilelite/stock_pile_lite.dart';

void main() async {
  enableFlutterDriverExtension();
  await StockPileLite.initialize();
  CustomerService service = GetIt.I<CustomerService>();

  Customer _getCustomer() {
    Customer customer = Customer.instance();
    customer.firstName = 'Jonh Lourence';
    customer.lastName = 'Gania';
    customer.age = 22;
    customer.address = 'Sebaste, Sibunag, Guimaras';
    customer.birthDate = 1602864000000; // Oct 17, 2020
    customer.contactNumber = '09777151243';
    customer.coMaker = 'Cherry May Gania';
    customer.coMakerContactNumber = '09486324067';
    return customer;
  }

  test('create', (){
    Customer savedCustomer;
    try {
      savedCustomer = service.create(_getCustomer());
      expect(savedCustomer.firstName, 'Jonh Lourence');
      expect(savedCustomer.lastName, 'Gania');
      expect(savedCustomer.age, 22);
      expect(savedCustomer.address, 'Sebaste, Sibunag, Guimaras');
      expect(savedCustomer.birthDate, 1602864000000);
      expect(savedCustomer.contactNumber, '09777151243');
      expect(savedCustomer.coMaker, 'Cherry May Gania');
      expect(savedCustomer.coMakerContactNumber, '09486324067');
    } finally {
      savedCustomer.delete();
    }
  });

  test('update', (){
    Customer savedCustomer;
    try {
      savedCustomer = service.create(_getCustomer());
      savedCustomer.firstName = 'Renjie';
      Customer updatedCustomer = service.update(savedCustomer);
      expect(updatedCustomer.firstName, 'Renjie');
    } finally {
      savedCustomer.delete();
    }
  });

  test('find', (){
    Customer savedCustomer;
    try {
      savedCustomer = service.create(_getCustomer());
      expect(service.find(savedCustomer.id), savedCustomer);
    } finally {
      savedCustomer.delete();
    }
  });

  test('findNonExistent', (){
    try {
      service.find('randomString');
    } catch (e) {
      expect(e.message, 'Customer does not exist');
    }
  });
}