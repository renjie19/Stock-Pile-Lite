import 'package:get_it/get_it.dart';
import 'package:stockpilelite/backend/item/item_repository.dart';
import 'package:stockpilelite/shared/models/item.dart';

class ItemService {
  ItemRepository _repository = GetIt.I<ItemRepository>();

  Item create(Item item) {
    if (item == null) {
      return null;
    }
    return _repository.save(item);
  }

  Item update(Item item) {
    if (item == null) {
      return null;
    }
    return _repository.save(item);
  }

  Item find(String id) {
    Item foundItem = _repository.find(id);
    throwIf(foundItem == null, Exception('Item does not exist'));
    return foundItem;
  }

  List<Item> findAll() {
    return _repository.findAll();
  }

  void delete(String id) {
    find(id);
    _repository.delete(id);
  }

  void deleteAll() {
    _repository.deleteAll();
  }
}