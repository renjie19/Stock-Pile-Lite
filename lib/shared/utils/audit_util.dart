
import 'package:flutter/material.dart';
import 'package:stockpilelite/shared/commons/models/base_model.dart';

class AuditTrailUtil {
  static BaseModel add(BaseModel model) {
    var now = DateTime.now().millisecondsSinceEpoch;
    model.id = UniqueKey().toString();
    model.dateCreated = now;
    model.dateModified = now;
    return model;
  }

  static BaseModel update(BaseModel model) {
    model.dateModified = DateTime.now().millisecondsSinceEpoch;
  }
}