import 'package:hive/hive.dart';
import 'package:stockpilelite/shared/commons/models/base_model.dart';
part '../adapters/stock_batch.g.dart';

@HiveType(typeId: 5)
class StockBatch extends BaseModel {
  @HiveField(6)
  String batchNumber;
  @HiveField(7)
  HiveList stockItems;

  StockBatch(id, dateCreated, dateModified, createdBy, modifiedBy, active,
      this.batchNumber, this.stockItems)
      : super(id: id, dateCreated: dateCreated, dateModified: dateModified, createdBy:createdBy, modifiedBy:modifiedBy, active:active);

  StockBatch.instance();
}
