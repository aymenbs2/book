import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';

import 'helpers/map_helper.dart';
import 'helpers/path_helper.dart';

class MbookStorage {
  MbookStorage();

  Future<T> insert<T>(book, key, value) async {
    await File(await PathHelper.temporaryDirectory + "/$book/$key.txt")
        .create(recursive: true);
    File f = File(await PathHelper.temporaryDirectory + "/$book/$key.txt");
    if (isSimpleType(value)) {
      f.writeAsString(value);
      return value;
    }
    f.writeAsString(jsonEncode(MapHelper.objectToMap(value)));
    return value;
  }

  // T select<T>(String key, defaultValue) {
  //
  //
  //   return MapHelper.mapToObject<T>();
  // }

  delete(String key) {}

  bool isSimpleType(value) {
    return value.runtimeType.toString().toLowerCase() == "string" ||
        value.runtimeType.toString().toLowerCase() == "int" ||
        value.runtimeType.toString().toLowerCase() == "double" ||
        value.runtimeType.toString().toLowerCase() == "bool";
  }
}
