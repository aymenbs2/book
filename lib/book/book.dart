library mbook;
import 'book_manager.dart';

class Book {

  static BookManager book(name)  {
    return BookManager(name);
  }
}


