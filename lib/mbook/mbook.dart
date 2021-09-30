library mbook;

import 'book.dart';

class MBook {
   main() async {
    Test t = Test();
    t.name = "secondTest";
    Book b = Book("myBook");
    await b.write<Test>("first_paper", t);
    await b.write<int>("second_paper", 2000);
  }
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
