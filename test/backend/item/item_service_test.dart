import 'package:flutter_driver/driver_extension.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:stockpilelite/backend/item/item_service.dart';
import 'package:stockpilelite/shared/models/item.dart';
import 'package:stockpilelite/stock_pile_lite.dart';

void main() async {
  enableFlutterDriverExtension();
  await StockPileLite.initialize();
  ItemService service = GetIt.I<ItemService>();

  Item _getItem() {
    Item item = Item.instance();
    item.name = 'Test';
    item.brand = 'Brand';
    item.capital = 100.50;
    item.itemCode = '001-01010';
    item.retail = 115.45;
    item.wholeSale = 112.0;
    item.modifiedBy = 'admin';
    item.createdBy = 'admin';
    return item;
  }

  test('create', () {
    Item createdItem;
    try {
      createdItem = service.create(_getItem());
      expect(createdItem.id.isNotEmpty, true);
      expect(createdItem.dateCreated > 0, true);
      expect(createdItem.dateModified > 0, true);
      expect(createdItem.active, true);
      expect(createdItem.createdBy, 'admin');
      expect(createdItem.modifiedBy, 'admin');
    } finally {
      createdItem.delete();
    }
  });

  test('update', () {
    Item itemCreated;
    try {
      itemCreated = service.create(_getItem());
      itemCreated.name = 'Test2';
      Item updatedItem = service.update(itemCreated);
      expect(updatedItem.name, 'Test2');
    } finally {
      itemCreated.delete();
    }
  });

  test('find', (){
    Item itemCreated;
    try {
      itemCreated = service.create(_getItem());
      expect(service.find(itemCreated.id), itemCreated);
    } finally {
      itemCreated.delete();
    }
  });

  test('findNotFound', (){
    try {
      service.find('randomString');
    } catch (e) {
      expect(e.message, 'Item does not exist');
    }
  });
}