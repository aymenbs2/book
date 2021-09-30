import 'dart:convert';
import 'dart:io';
import 'package:mbook/helpers/data_type_heper.dart';
import '../helpers/map_helper.dart';
import '../helpers/path_helper.dart';

class MbookStorage {
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

  // T select<T>(String key, defaultValue) {
  //
  //
  //   return MapHelper.mapToObject<T>();
  // }

  delete(String key) {}
}
