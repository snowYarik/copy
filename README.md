* Automatically generating `copyWith` extensions code for classes with `@Copyable()` annotation.
This package supports `copyWith` with a null value.

## For example
```
//2 lines below are required
import 'package:copy/copy.dart';
part 'basic_class.g.dart';

// @Copyable is required
@Copyable()
class BasicClass {
  final String name;
  final int age;

  BasicClass({this.name, this.age});
}
```
## Run

* For build once

`flutter pub run build_runner build --delete-conflicting-outputs`

* For automatically rebuild when the file changes

`flutter pub run build_runner watch --delete-conflicting-outputs`

## Use

```
BasicClass basic = BasicClass(name: 'name',age: 18);
basic = basic.copyWith(name: Value('new name'));
// basic should be ('new name',18)

basic = basic.copyWith(age: Value(null));
// basic should be ('new name',null)
```
