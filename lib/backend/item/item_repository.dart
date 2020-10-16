import 'package:hive/hive.dart';
import 'package:stockpilelite/shared/constants/boxes.dart';
import 'package:stockpilelite/shared/models/item.dart';

class ItemRepository {
  Box<Item> _itemBox;

  ItemRepository() {
    _initializeBox();
  }

  _initializeBox() async {
    Hive.registerAdapter(ItemAdapter());
    this._itemBox = await Hive.openBox<Item>(Boxes.ITEM);
  }

  Item save(Item item) {
    _itemBox.put(item.id, item);
    return item;
  }

  Item find(String id) {
    return _itemBox.get(id);
  }

  List<Item> findAll() {
    return List.from(_itemBox.values);
  }

  void delete(String id) {
    Item item = find(id);
    item.delete();
  }

  void deleteAll() {
    _itemBox.clear();
  }
}