import 'package:stockpilelite/shared/dtos/item_dto.dart';
import 'package:stockpilelite/shared/models/item.dart';

class ItemMapper {
  static Item toEntity(final ItemDto dto, final Item entity) {
    entity.itemCode = dto.itemCode;
    entity.name = dto.name;
    entity.brand = dto.brand;
    entity.capital = dto.capital;
    entity.retail = dto.retail;
    entity.wholeSale = dto.wholeSale;
    return entity;
  }

  static ItemDto toDto(final Item item) {
    final ItemDto dto = ItemDto();
    dto.itemCode = item.itemCode;
    dto.id = item.id;
    dto.name = item.name;
    dto.brand = item.brand;
    dto.capital = item.capital;
    dto.retail = item.retail;
    dto.wholeSale = item.wholeSale;
    return dto;
  }
}