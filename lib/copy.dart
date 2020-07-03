/// Configuration for using `package:build`-compatible build systems.
///
/// See:
/// * [build_runner](https://pub.dev/packages/build_runner)
///
/// This library is **not** intended to be imported by typical end-users unless
/// you are creating a custom compilation pipeline. See documentation for
/// details, and `build.yaml` for how these builders are configured by default.
library copy.builder;

import 'package:build/build.dart' show Builder, BuilderOptions;
import 'package:source_gen/source_gen.dart' show SharedPartBuilder;

import 'src/copy_generator.dart';
export 'src/copy.dart';

Builder copyWith(BuilderOptions _) => SharedPartBuilder(
      [CopyWithGenerator()],
      'copyWith',
    );
