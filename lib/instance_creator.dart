import 'package:reflectable/reflectable.dart';

import 'book.dart';

const mbookReflectable = MbookReflectable();

class InstanceCreator {
  static createInstance(Type type,
      { List? arguments,  Map<Symbol, dynamic>? namedArguments}) {

    arguments ??= const [];
    namedArguments ??= {};

    var typeMirror = mbookReflectable.reflectType(type);
    if (typeMirror is ClassMirror) {
      return typeMirror.newInstance(
          ''  , arguments, namedArguments);
    } else {
      throw ArgumentError(
          "Cannot create the instance of the type '$type'.");
    }
    ;
  }
}
