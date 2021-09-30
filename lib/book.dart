
import 'package:mbook/helpers/map_helper.dart';
import 'package:mbook/mbook_storage.dart';
import 'package:reflectable/reflectable.dart';

import 'mbook_db_exception.dart';

const MBookReflectable = MbookReflectable();

class MbookReflectable extends Reflectable {
  const MbookReflectable()
      : super(newInstanceCapability, instanceInvokeCapability,
            declarationsCapability, metadataCapability);
}

class Book {
  final MbookStorage _dbStorage = MbookStorage();

  String name;

  Book(this.name);

  Future<T> write<T>(key, T value) async {
    if (value == null) {
      throw MBookDbException("Mbook doesn't support null root values");
    } else {
     return  _dbStorage.insert(name,key, value);
    }
  }

  // T read<T>(String key, {dynamic defaultValue}) {
  //   // return _dbStorage.select<T>(key, defaultValue);
  // }
}
