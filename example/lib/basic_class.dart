import 'package:meta/meta.dart' show immutable;
import 'package:copy/copy.dart';
//Don't work without it!
part 'basic_class.g.dart';

@immutable
@Copy()
class BasicClass {
  final String name;
  final int age;

  BasicClass({this.name, this.age});
}
