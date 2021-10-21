import 'dart:convert';
import 'dart:io';
import 'package:book/book/book_db_exception.dart';
import 'package:book/helpers/data_type_heper.dart';
import 'package:flutter/material.dart';

import '../helpers/map_helper.dart';
import '../helpers/path_helper.dart';

class BookStorage {
  Future<T> insert<T>(book, key, value) async {
    await File(await PathHelper.temporaryDirectory + "/$book/$key.txt")
        .create(recursive: true);
    File f = File(await PathHelper.temporaryDirectory + "/$book/$key.txt");
    if (DataTypeHelper.isSimpleType(value)) {
      f.writeAsString(value.toString());
      return value;
    }
    if (DataTypeHelper.isIterable(value)) {
      _saveList(value, f);
      return value;
    }
    f.writeAsString(jsonEncode(MapHelper.objectToMap(value)));
    return value;
  }

  void _saveList(value, File f) {
    var savableList = [];
    for (var elem in value) {
      savableList.add(!DataTypeHelper.isSimpleType(elem)
          ? MapHelper.objectToMap(elem)
          : elem);
    }
    f.writeAsString(jsonEncode(savableList));
  }

  Future<T> select<T>(String book, String key, defaultValue) async {
    var path = (await PathHelper.temporaryDirectory) + "/$book/$key.txt";
    var file = File(path);
    var content = jsonDecode(await file.readAsString());
    if (!DataTypeHelper.isIterable(content) &&
        content != null &&
        content != "") {
      return DataTypeHelper.isSimpleType(content)
          ? Future.value(content)
          : Future.value(MapHelper.mapToObject<T>(content));
    }
    return Future.value(defaultValue);
  }

  Future<T> selectIterable<T, R>(String book, String key, defaultValue) async {
    var path = (await PathHelper.temporaryDirectory) + "/$book/$key.txt";
    var file = File(path);
    var content = jsonDecode(await file.readAsString());
     List<R> res= [];
    if (DataTypeHelper.isIterable(content)) {
      for (var elem in content) {
        if (!DataTypeHelper.isSimpleType(elem)) {
          res.add(MapHelper.mapToObject<R>(elem));
        } else {
          res.add(elem);
        }
      }
      return Future.value(res as T);
    } else if (content != "") {
      return Future.value(MapHelper.mapToObject<T>(content));
    }
    return Future.value(defaultValue);
  }

  delete(String key) {}
}
