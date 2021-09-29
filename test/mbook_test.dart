import 'package:flutter_test/flutter_test.dart';

import 'package:mbook/mbook.dart';

import 'mbook_test.reflectable.dart';

void main() {
  initializeReflectable();

  test('adds one to input values', () {
    final book = MBook();
    book.main();
  });
}
