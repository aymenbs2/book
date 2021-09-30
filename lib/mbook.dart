library mbook;


import 'book.dart';

class MBook {
  void main() async{
    Test t = Test();
    t.name = "hellow";
    Book b = Book("dqsdqsqs");
    print((await b.write<Test>("key", t)).toString());

  }
}

@MBookReflectable
class Test {
  Test();
  String name = "";
  int id = 0;
  bool isHuman=true;
  bool isAnimal=false;
  double weight=1.55;
  num nb=1.55;
  num nb2=1;

  @override
  String toString() {
    return 'Test{name: $name, id: $id, isHuman: $isHuman, isAnimal: $isAnimal, weight: $weight, nb: $nb, nb2: $nb2}';
  }
}
