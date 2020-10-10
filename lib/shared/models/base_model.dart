import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';

part '../adapters/base_model.g.dart';

@HiveType(typeId: 1)
class BaseModel extends HiveObject {
  @HiveField(0)
  String id = UniqueKey().toString();
  @HiveField(1)
  int dateCreated = DateTime.now().millisecondsSinceEpoch;
  @HiveField(2)
  int dateModified = DateTime.now().millisecondsSinceEpoch;
  @HiveField(3)
  String createdBy;
  @HiveField(4)
  String modifiedBy;
  @HiveField(5)
  bool active;

  BaseModel(
      {String id,
      int dateCreated,
      int dateModified,
      String createdBy,
      String modifiedBy,
      bool active}) {
    if (dateCreated != null && dateCreated > 0) {
      this.dateCreated = dateCreated;
    }

    if (dateModified != null && dateModified > 0) {
      this.dateModified = dateModified;
    }

    this.active = active ?? true;

    if (id != null && id.isNotEmpty) {
      this.id = id;
    }
  }

  BaseModel.instance();

  @override
  Future<void> save() async {
    this.dateModified = DateTime.now().millisecondsSinceEpoch;
    return super.save();
  }
}
