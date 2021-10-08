import 'package:flutter_test/flutter_test.dart';
import 'package:book/book/book.dart';

import 'package:book/book/book.dart';
import 'package:book/book/book_manager.dart';

import 'book_test.reflectable.dart';

void main() {
  initializeReflectable();

  test('save list of savable objects or simple objects', () async {
    Test t = Test();
    t.name = "secondTest";
    BookManager b =Book.book("myBook2");
    var list = [];
    list.add(t);
    list.add(t);
    list.add(t);
    list.add(t);
    await b.write<List>("lsit_paper", list);
  });

  test('read data from a book', () async {
    Test t = Test();
    t.name = "secondTest";
    BookManager b =Book.book("myBook2");
   await b.read<List>("lsit_paper",defaultValue:null);
  });
}
@savable
class Test {
  Test();

  String name = "";
  int id = 0;
  bool isHuman = true;
  bool isAnimal = false;
  double weight = 1.55;
  num nb = 1.55;
  num nb2 = 1;

  @override
  String toString() {
    return 'Test{name: $name, id: $id, isHuman: $isHuman, isAnimal: $isAnimal, weight: $weight, nb: $nb, nb2: $nb2}';
  }
}