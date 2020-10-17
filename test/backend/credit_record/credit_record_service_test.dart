import 'package:flutter_driver/driver_extension.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:stockpilelite/backend/credit/credit_record_service.dart';
import 'package:stockpilelite/backend/customer/customer_service.dart';
import 'package:stockpilelite/backend/payment/payment_service.dart';
import 'package:stockpilelite/shared/constants/boxes.dart';
import 'package:stockpilelite/shared/constants/payment_status.dart';
import 'package:stockpilelite/shared/models/credit_item.dart';
import 'package:stockpilelite/shared/models/credit_record.dart';
import 'package:stockpilelite/shared/models/customer.dart';
import 'package:stockpilelite/shared/models/item.dart';
import 'package:stockpilelite/shared/models/payment.dart';
import 'package:stockpilelite/stock_pile_lite.dart';

void main() async {
  enableFlutterDriverExtension();
  await StockPileLite.initialize();

  CreditRecordService service = GetIt.I<CreditRecordService>();
  CustomerService customerService = GetIt.I<CustomerService>();
  PaymentService paymentService = GetIt.I<PaymentService>();

  Customer _getCustomer() {
    customerService.deleteAll();
    Customer customer = Customer.instance();
    customer.firstName = 'Jonh Lourence';
    customer.lastName = 'Gania';
    customer.age = 22;
    customer.address = 'Sebaste, Sibunag, Guimaras';
    customer.birthDate = 1602864000000; // Oct 17, 2020
    customer.contactNumber = '09777151243';
    customer.coMaker = 'Cherry May Gania';
    customer.coMakerContactNumber = '09486324067';
    return customerService.create(customer);
  }

  List<CreditItem> _getItems() {
    List<CreditItem> items = [];
    for (int x = 0; x <= 10; x++) {
      CreditItem item = CreditItem();
      item.name = 'Test';
      item.brand = 'Brand';
      item.total = 150;
      item.quantity = 3;
      item.price = 50;
      items.add(item);
    }
    return items;
  }

  List<Payment> _getPayments() {
    List<Payment> payments = [];
    for(int x = 0; x <= 3; x++) {
      Payment payment = Payment.instance();
      payment.dateCreated = 1602892800000; // Oct 17, 2020 08:00:00
      payment.amount = 150;
      payment.change = 0;
      payment.receivedAmount = 150;
      payment.receivedBy = 'admin';
      payment.paidBy = 'user';
      payments.add(paymentService.create(payment));
    }
    return payments;
  }

  CreditRecord _getCreditRecord() {
    CreditRecord record = CreditRecord.instance();
    record.paymentStatus = PaymentStatus.UNPAID;
    record.items = _getItems();
    record.customer = _getCustomer();
    record.payments = _getPayments();
    record.totalAmount = 1500;
    record.amountPaid = 0;
    record.transferredAmount = 0;
    return record;
  }

  test('create',() {
    CreditRecord record;
    try {
      record = service.create(_getCreditRecord());
      expect(record.customer, customerService.find(record.customer.id));
      expect(record.payments.length, paymentService.findAll(1602864000000, 1602950399000).length);
      expect(record.transferredAmount, 0);
      expect(record.amountPaid, 0);
      expect(record.totalAmount, 1500);
      expect(record.items.length, _getItems().length);
      expect(record.paymentStatus, PaymentStatus.UNPAID);
    } finally {
      record.customer.delete();
      record.payments.forEach((element) => element.delete());
      record.delete();
    }
  });
}