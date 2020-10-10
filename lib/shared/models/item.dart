import 'package:hive/hive.dart';
import 'package:stockpilelite/shared/models/base_model.dart';
part '../adapters/item.g.dart';

@HiveType(typeId: 4)
class Item extends BaseModel {
  @HiveField(6)
  String itemCode;
  @HiveField(7)
  String name;
  @HiveField(8)
  String brand;
  @HiveField(9)
  double capital;
  @HiveField(10)
  double retail;
  @HiveField(11)
  double wholeSale;

  Item(
      id,
      dateCreated,
      dateModified,
      createdBy,
      modifiedBy,
      active,
      this.itemCode,
      this.name,
      this.brand,
      this.capital,
      this.retail,
      this.wholeSale)
      :super(id: id, dateCreated: dateCreated, dateModified: dateModified, createdBy:createdBy, modifiedBy:modifiedBy, active:active);

  Item.instance();
}
