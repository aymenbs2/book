import 'package:path_provider/path_provider.dart';

class PathHelper{


  Future<String> get ApplicationDocumentsDirectory async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }
}