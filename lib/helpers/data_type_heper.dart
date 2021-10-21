class DataTypeHelper{
  static bool isSimpleType(value) {
    return value.runtimeType.toString().toLowerCase() == "string" ||
        value.runtimeType.toString().toLowerCase() == "int" ||
        value.runtimeType.toString().toLowerCase() == "double" ||
        value.runtimeType.toString().toLowerCase() == "bool";
  }
  static bool isIterable(value) {
    return value is Iterable;
  }
}