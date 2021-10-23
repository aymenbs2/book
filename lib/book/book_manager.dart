import 'package:reflectable/reflectable.dart';

import 'book_db_exception.dart';
import 'book_storage.dart';

const savable = BookReflectable();

class BookReflectable extends Reflectable {
  const BookReflectable()
      : super(newInstanceCapability, instanceInvokeCapability,
            declarationsCapability, metadataCapability);
}

class BookManager {
  final BookStorage _dbStorage = BookStorage();

  String name;

  BookManager(this.name);

  Future<T> write<T>(key, T value) async {
    if (value == null) {
      throw BookDbException("Mbook doesn't support null root values");
    } else {
      return _dbStorage.insert(name, key, value);
    }
  }

  Future<T> read<T>(String key, {required T defaultValue}) async {
    return await _dbStorage.select<T>(name, key, defaultValue);
  }

  Future<T> readIterable<T>(String key, {dynamic defaultValue}) async {
    return await _dbStorage.selectIterable<T>(name, key, defaultValue);
  }
}
