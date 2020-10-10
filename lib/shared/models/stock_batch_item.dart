import 'package:hive/hive.dart';
part '../adapters/stock_batch_item.g.dart';

@HiveType(typeId: 6)
class StockBatchItem {
  @HiveField(6)
  String name;
  @HiveField(7)
  String brand;
  @HiveField(8)
  double capital;
  @HiveField(9)
  String itemCode;
  @HiveField(10)
  double quantity;
}