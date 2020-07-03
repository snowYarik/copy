import 'package:copy/copy.dart';
import 'package:copy_example/basic_class.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('basic test', () async {
    BasicClass basicClass = BasicClass();
    print(basicClass.toMap());

    basicClass = basicClass.copyWith(age: Value(10));
    print(basicClass.toMap());

    basicClass = basicClass.copyWith(name: Value('new name'));
    print(basicClass.toMap());
  });
}
