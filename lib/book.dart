import 'package:flutter/cupertino.dart';
import 'package:mbook/mbook_storage.dart';
import 'package:reflectable/reflectable.dart';

import 'Book.dart';
import 'mbook_db_exception.dart';
const myReflectable = MbookReflectable();
class MbookReflectable extends Reflectable {
  const MbookReflectable() : super(instanceInvokeCapability,declarationsCapability,metadataCapability);
}
class Book {
  final MbookStorage _dbStorage= MbookStorage();

  String name;

  Book(this.name);


  T write<T>(key, T value) {
    if (value == null) {
      throw MBookDbException("Mbook doesn't support writing null root values");
    } else {
      print(objectToMap(value));
      _dbStorage.insert(key, value);

    }
    return objectToMap(value);
  }

  T read<T>(String key, {dynamic defaultValue}) {
    return _dbStorage.select<T>(key, defaultValue);
  }

  Map objectToMap(Object object)
  {
    // Mirror the particular instance (rather than the class itself)
    InstanceMirror instanceMirror = myReflectable.reflect(object);
    Map dataMapped = new Map();

    // Mirror the instance's class (type) to get the declarations
    for (var declaration in instanceMirror.type.declarations.values)
    {
      // If declaration is a type of variable, map variable name and value
      if (declaration is VariableMirror)
      {
        String variableName = declaration.simpleName;
        String variableValue = instanceMirror.invokeGetter(declaration.simpleName).toString();
        dataMapped[variableName] = variableValue;
      }
    }
    return dataMapped;
  }
}
