import 'package:get_it/get_it.dart';
import 'package:stockpilelite/shared/dtos/item_dto.dart';
import 'package:stockpilelite/shared/models/item.dart';
import 'package:stockpilelite/shared/utils/user_profile_tracker.dart';

class ItemMapper {
  static UserProfileTracker _userProfileTracker = GetIt.I<UserProfileTracker>();
  static Item toEntity(final ItemDto dto, final Item entity) {
    setUserTrail(entity);
    entity.itemCode = dto.itemCode;
    entity.name = dto.name;
    entity.brand = dto.brand;
    entity.capital = dto.capital;
    entity.retail = dto.retail;
    entity.wholeSale = dto.wholeSale;
    return entity;
  }

  static void setUserTrail(Item entity) {
    if (entity.createdBy == null || entity.createdBy.isEmpty) {
      entity.createdBy = _userProfileTracker.user;
    }
    entity.modifiedBy = _userProfileTracker.user;
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