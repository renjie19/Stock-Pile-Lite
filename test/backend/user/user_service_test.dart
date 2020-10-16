import 'package:flutter/cupertino.dart';
import 'package:flutter_driver/driver_extension.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:stockpilelite/backend/user/user_repository.dart';
import 'package:stockpilelite/backend/user/user_service.dart';
import 'package:stockpilelite/shared/models/user.dart';
import 'package:stockpilelite/stock_pile_lite.dart';

void main() async {
  enableFlutterDriverExtension();
  await StockPileLite.initialize();

  UserService service = GetIt.I<UserService>();

  User _getUser() {
    User user = User.instance();
    user.createdBy = 'admin';
    user.modifiedBy = 'admin';
    user.firstName = 'John Lourence';
    user.lastName = 'Gania';
    user.birthday = 885139200000; // January 19, 1998
    user.age = 22;
    user.dateCreated = 1602259200000;
    user.dateModified = 1602259200000;
    return user;
  }

  test('create', () {
    User result;
    try {
      result = service.create(_getUser());
      expect(result.id.isNotEmpty, true);
      expect(result.createdBy, 'admin');
      expect(result.modifiedBy, 'admin');
      expect(result.dateCreated > 0, true);
      expect(result.dateModified > 0, true);
      expect(result.active, true);
      expect(result.firstName, 'John Lourence');
      expect(result.lastName, 'Gania');
      expect(result.birthday, 885139200000);
      expect(result.age, 22);
      expect(result.fullName, 'John Lourence Gania');
    } finally {
      service.delete(result);
    }
  });

  test('create duplicate', () {
    User result;
    try {
      result = service.create(_getUser());
      service.create(_getUser());
    } catch (e) {
      expect(e.message, 'User with name already exists');
    } finally {
      service.delete(result);
    }
  });

  test('update', () {
    User result;
    try {
      result = service.create(_getUser());
      result.firstName = 'Test';
      User update = service.update(result);
      expect(update.firstName, 'Test');
      expect(update.dateModified != 1602259200000, true);
    } finally {
      service.delete(result);
    }
  });

  test('find', () {
    User result;
    try {
      result = service.create(_getUser());
      User foundUser = service.find(result.id);
      expect(foundUser, result);
    } finally {
      service.delete(result);
    }
  });

  test('find non existing', () {
    try {
      service.find(UniqueKey().toString());
    } catch (e) {
      expect(e.message, 'User does not exist');
    }
  });

  test('findAll', () {
    User user1 = _getUser();
    User user2 = _getUser();
    user2.firstName = 'Test';
    try {
      user1 = service.create(user1);
      user2 = service.create(user2);
      expect(service.findAll().length, 2);
    } finally {
      service.delete(user1);
      service.delete(user2);
    }
  });

  test('toggleStatus', () {
    User result;
    try {
      result = service.create(_getUser());
      service.toggleStatus(result.id);
      expect(result.active, false);
    } finally {
      service.delete(result);
    }
  });
}
