import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';

import 'helpers/map_helper.dart';

class MbookStorage {
  MbookStorage();

  Future<String> get _localPath async {
    final directory = await getTemporaryDirectory();
    return directory.path;
  }

  Future<T> insert<T>(key, value) async {
    File f = File(await _localPath+"/$key.txt");
    f.writeAsString(jsonEncode(MapHelper.objectToMap(value)));
    return MapHelper.mapToObject<T>(MapHelper.objectToMap(value));
  }

  // T select<T>(String key, defaultValue) {
  //
  //
  //   return MapHelper.mapToObject<T>();
  // }

  delete(String key) {}
}
