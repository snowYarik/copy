import 'package:copy/copy.dart';
import 'package:meta/meta.dart' show immutable, required;

part 'sub_class.g.dart';

abstract class AClass {
  final String aString;

  AClass(this.aString);
}

@immutable
@Copy()
class BasicBaseClass {
  final String id;

  BasicBaseClass({this.id});
}

mixin TestMixin on BasicBaseClass {
  String get mixinMethod;
}

@immutable
@Copy()
class BasicBaseSubClass<T> extends BasicBaseClass {
  final String id;
  final T item;

  BasicBaseSubClass({this.id, this.item});
}

@immutable
@Copy()
class SubClass<T, U extends String> extends BasicBaseSubClass<T>
    with TestMixin
    implements AClass {
  final DateTime date;
  final String aString;
  final String privateField;
  static String staticStr;
  final List<T> listWithGenericType;
  final List<Iterable<U>> listWithTypedType;
  final List<int> listWithType;
  final T item;

  SubClass({
    String id,
    @required this.date,
    this.privateField,
    this.aString,
    this.listWithGenericType,
    this.listWithTypedType,
    this.listWithType,
    this.item,
  }) : super(id: id);

  SubClass.secondConstructor({String id})
      : this(id: id, date: DateTime.now(), privateField: "", aString: "");

  factory SubClass.testFactory() {
    return SubClass.secondConstructor(id: "");
  }

  String get testMethod {
    return "test";
  }

  String get mixinMethod {
    return "test";
  }
}