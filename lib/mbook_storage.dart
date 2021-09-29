import 'package:path_provider/path_provider.dart';

class MbookStorage {
  MbookStorage();

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  void insert<T>(key, value) {
    dynamic d = value;
    print(d);
  }

  select<T>(String key, defaultValue) {}

  delete(String key) {}
}
