import 'package:copy/copy.dart';

part 'basic_class.g.dart';

@Copyable()
class BasicClass extends A {
  final String name;
  final int age;

  const BasicClass({this.name, this.age, int height}) : super(height: height);
}

class A {
  const A({this.height});

  final int height;
}
