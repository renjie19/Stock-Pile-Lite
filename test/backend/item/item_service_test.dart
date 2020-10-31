import 'package:flutter_driver/driver_extension.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:stockpilelite/backend/item/item_service.dart';
import 'package:stockpilelite/shared/dtos/item_dto.dart';
import 'package:stockpilelite/shared/models/item.dart';
import 'package:stockpilelite/stock_pile_lite.dart';

void main() async {
  enableFlutterDriverExtension();
  await StockPileLite.initialize();
  ItemService service = GetIt.I<ItemService>();

  ItemDto _getItem() {
    ItemDto item = ItemDto();
    item.name = 'Test';
    item.brand = 'Brand';
    item.capital = 100.50;
    item.itemCode = '001-01010';
    item.retail = 115.45;
    item.wholeSale = 112.0;
    return item;
  }

  test('create', () {
    ItemDto createdItem;
    try {
      createdItem = service.create(_getItem());
      expect(createdItem.id.isNotEmpty, true);
      expect(createdItem.itemCode, '001-01010');
      expect(createdItem.name, 'Test');
      expect(createdItem.brand, 'Brand');
      expect(createdItem.capital, 100.50);
      expect(createdItem.retail, 115.45);
      expect(createdItem.wholeSale, 112.0);
    } finally {
      service.delete(createdItem.id);
    }
  });

  test('update', () {
    ItemDto itemCreated;
    try {
      itemCreated = service.create(_getItem());
      itemCreated.name = 'Test2';
      ItemDto updatedItem = service.update(itemCreated);
      expect(updatedItem.name, 'Test2');
    } finally {
      service.delete(itemCreated.id);
    }
  });

  test('find', (){
    ItemDto itemCreated;
    try {
      itemCreated = service.create(_getItem());
      expect(service.find(itemCreated.id) != null, true);
    } finally {
      service.delete(itemCreated.id);
    }
  });

  test('findNotFound', () {
    try {
      service.find('randomString');
    } catch (e) {
      expect(e.message, 'Item does not exist');
    }
  });
}