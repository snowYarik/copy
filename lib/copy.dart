library copy.builder;

import 'package:build/build.dart' show Builder, BuilderOptions;
import 'package:source_gen/source_gen.dart' show SharedPartBuilder;

import 'src/copy_generator.dart';

export 'src/copy.dart';

Builder copyWith(BuilderOptions _) => SharedPartBuilder(
      [CopyWithGenerator()],
      'copyWith',
    );
