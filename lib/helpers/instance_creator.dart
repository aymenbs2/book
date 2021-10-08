import 'package:book/book/book_manager.dart';
import 'package:reflectable/reflectable.dart';

import '../book/book.dart';

const bookReflectable = BookReflectable();

class InstanceCreator {
  static createInstance(Type type,
      {List? arguments, Map<Symbol, dynamic>? namedArguments}) {
    arguments ??= const [];
    namedArguments ??= {};
    var typeMirror = bookReflectable.reflectType(type);
    if (typeMirror is ClassMirror) {
      return typeMirror.newInstance('', arguments, namedArguments);
    } else {
      throw ArgumentError("Cannot create the instance of the type '$type'.");
    }
  }
}
