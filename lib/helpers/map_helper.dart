import 'package:reflectable/mirrors.dart';

import '../mbook/book.dart';
import 'instance_creator.dart';

 class MapHelper {

  static T mapToObject<T>(Map map) {
    T instance = InstanceCreator.createInstance(T);
    var instanceMirror = savable.reflect(instance!);
    map.keys.toList().asMap().forEach((index, value) {
      _setVariablesValues(instanceMirror, value, map, index);
    });

    return instance;
  }

  static Map objectToMap(Object object) {
    // Mirror the particular instance (rather than the class itself)
    InstanceMirror instanceMirror = savable.reflect(object);
    Map dataMapped = {};
    // Mirror the instance's class (type) to get the declarations varibales
    for (var declaration in instanceMirror.type.declarations.values) {
      // If declaration is a type of variable, map variable name and value
      if (declaration is VariableMirror) {
        String variableName = declaration.simpleName;
        String variableValue =
            instanceMirror.invokeGetter(declaration.simpleName).toString();
        dataMapped[variableName] = variableValue;
      }
    }
    return dataMapped;
  }

  static void _setVariablesValues(InstanceMirror instanceMirror, value,
      Map<dynamic, dynamic> map, int index) {
    switch (instanceMirror.invokeGetter(value).runtimeType.toString()) {
      case 'int':
        instanceMirror.invokeSetter(
            value, int.tryParse(map.values.elementAt(index)));
        break;
      case 'String':
        instanceMirror.invokeSetter(
            value, map.values.elementAt(index) as String);
        break;
      case 'double':
        instanceMirror.invokeSetter(
            value, double.tryParse(map.values.elementAt(index)));
        break;
      case 'bool':
        instanceMirror.invokeSetter(value,
            map.values.elementAt(index).toString().toLowerCase() == "true");
        break;
      case 'num':
        instanceMirror.invokeSetter(
            value, num.tryParse(map.values.elementAt(index)));
        break;
    }
  }
}
