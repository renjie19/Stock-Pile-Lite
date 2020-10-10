import 'package:hive/hive.dart';
part '../adapters/credit_item.g.dart';

@HiveType(typeId: 9)
class CreditItem {
  @HiveField(0)
  String name;
  @HiveField(1)
  String brand;
  @HiveField(2)
  double price; // price per quantity
  @HiveField(3)
  double quantity;
  @HiveField(4)
  double total; // overall price
}