import 'package:copy/copy.dart';

part 'basic_class.g.dart';

@Copyable()
class BasicClass extends A {
  final String name;
  final int age;

  const BasicClass({this.name, this.age, int height}) : super(height: height);

  Map<String, dynamic> toMap() {
    // ignore: unnecessary_cast
    return {
      'name': this.name,
      'age': this.age,
    } as Map<String, dynamic>;
  }
}

class A {
  const A({this.height});

  final int height;
}
