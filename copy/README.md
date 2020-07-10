* Automatically generating `copyWith` extensions code for classes with `@Copyable()` annotation.
This package supports `copyWith` with a null value.

## For example
```
//2 lines below are required
import 'package:copy/copy.dart'; // required
export 'package:copy/copy.dart'; // if you want to use ValueExtension

part 'basic_class.g.dart'; // required

// @Copyable is required
@Copyable()
class BasicClass {
  final String name;
  final int age;

  BasicClass({this.name, this.age});
}
```

## Install

```
dependencies:
  flutter:
    sdk: flutter

  copy: ^<newest>

dev_dependencies:
  flutter_test:
    sdk: flutter
  build_runner:
  copy_generator: ^<newest>
```

## Run

* For build once

`flutter pub run build_runner build --delete-conflicting-outputs`

* For automatically rebuild when the file changes

`flutter pub run build_runner watch --delete-conflicting-outputs`

## Use

```
BasicClass basic = BasicClass(name: 'name',age: 18);
basic = basic.copyWith(name: 'new name'.value);  // .value is Extension in ValueExtension
// basic should be ('new name',18)

basic = basic.copyWith(age: Value(null));
// basic should be ('new name',null)
```
