import 'package:get_it/get_it.dart';
import 'package:stockpilelite/backend/item/item_repository.dart';
import 'package:stockpilelite/shared/dtos/item_dto.dart';
import 'package:stockpilelite/shared/mappers/item_mapper.dart';
import 'package:stockpilelite/shared/models/item.dart';

class ItemService {
  ItemRepository _repository = GetIt.I<ItemRepository>();

  ItemDto create(ItemDto dto) {
    if (dto == null) {
      return null;
    }
    return ItemMapper.toDto(_repository.save(ItemMapper.toEntity(dto, Item.instance())));
  }
  ItemDto update(ItemDto dto) {
    if (dto == null) {
      return null;
    }
    Item foundItem = _find(dto.id);
    return ItemMapper.toDto(_repository.save(ItemMapper.toEntity(dto, foundItem)));
  }

  Item _find(String id) {
    Item foundItem = _repository.find(id);
    throwIf(foundItem == null, Exception('Item does not exist'));
    return foundItem;
  }

  ItemDto find(String id) {
    return ItemMapper.toDto(_find(id));
  }

  List<ItemDto> findAll() {
    return _repository.findAll().map((e) => ItemMapper.toDto(e));
  }

  void delete(String id) {
    _find(id);
    _repository.delete(id);
  }

  void deleteAll() {
    _repository.deleteAll();
  }
}