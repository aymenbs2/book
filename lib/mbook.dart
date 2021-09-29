library mbook;


import 'book.dart';

class MBook {
  void main() {
    Test t = Test();
    t.name = "hellow";
    Book b = Book("dqsdqsqs");
    b.write<Test>("key", t);
    print("yes we do ir"+t.name);
  }
}

@myReflectable
class Test {
  String name = "";
  int id = 0;


}
