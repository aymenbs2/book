library mbook;


import 'book.dart';

class MBook {
  void main() async{
    Test t = Test();
    t.name = "aymen";
    Book b = Book("first_book");
   //print((await b.write<Test>("first_paper", t)).toString());
    print((await b.write<int>("second_paper", 5)).toString());

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
