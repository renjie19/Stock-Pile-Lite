import 'package:stockpilelite/shared/dtos/user_dto.dart';
import 'package:stockpilelite/shared/mappers/base_mapper.dart';
import 'package:stockpilelite/shared/models/user.dart';

class UserMapper {
  static UserDto toDto(User entity) {
    if (entity == null) return null;
    UserDto userDto = UserDto();
    userDto.id = entity.id;
    userDto.firstName = entity.firstName;
    userDto.lastName = entity.lastName;
    userDto.birthday = entity.birthday;
    userDto.age = entity.age;
    return userDto;
  }

  static User toEntity(UserDto dto, User entity) {
    entity.firstName = dto.firstName;
    entity.lastName = dto.lastName;
    entity.birthday = dto.birthday;
    entity.age = dto.age;
    return entity;
  }



}