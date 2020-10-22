import 'package:stockpilelite/shared/dtos/user_profile_dto.dart';
import 'package:stockpilelite/shared/mappers/base_mapper.dart';
import 'package:stockpilelite/shared/mappers/user_mapper.dart';
import 'package:stockpilelite/shared/models/user_profile.dart';

class UserProfileMapper extends BaseMapper<UserProfile, UserProfileDto> {
  UserProfileDto toDto(UserProfile entity) {
    UserProfileDto dto = UserProfileDto();
    dto.user = UserMapper.toDto(entity.user);
    dto.username = entity.username;
    dto.password = entity.password;
    return dto;
  }

  UserProfile toEntity(UserProfileDto dto, UserProfile entity) {
    entity.username = dto.username;
    entity.password = dto.password;
    entity.user = UserMapper.toEntity(dto.user, entity.user);
    return entity;
  }

}