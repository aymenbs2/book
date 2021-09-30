import 'package:path_provider/path_provider.dart';

class PathHelper{


  static Future<String> get temporaryDirectory async {
    final directory = await getTemporaryDirectory();
    return directory.path;
  }
}