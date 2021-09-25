import 'package:flutter/cupertino.dart';
import 'package:mbook/mbook_storage.dart';

import 'Book.dart';
import 'mbook_db_exception.dart';

class Book {
  final MbookStorage _dbStorage= MbookStorage();

  String name;

  Book(this.name);


  T write<T>(key, T value) {
    if (value == null) {
      throw MBookDbException("Mbook doesn't support writing null root values");
    } else {
      _dbStorage.insert(key, value);
    }
    return value;
  }

  T read<T>(String key, {dynamic defaultValue}) {
    return _dbStorage.select<T>(key, defaultValue);
  }
}
