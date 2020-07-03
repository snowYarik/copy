import 'package:analyzer/dart/element/element.dart'
    show ClassElement, Element, ParameterElement, ConstructorElement;
import 'package:build/build.dart' show BuildStep;
import 'package:source_gen/source_gen.dart'
    show GeneratorForAnnotation, ConstantReader;

import 'copy.dart';

/// A `Generator` for `package:build_runner`
class CopyWithGenerator extends GeneratorForAnnotation<Copyable> {
  @override
  String generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) {
    if (element is! ClassElement) throw "$element is not a ClassElement";
    final ClassElement classElement = element as ClassElement;
    final List<_FieldInfo> sortedFields =
        _sortedConstructorFields(classElement);

    final String typeParametersAnnotation =
        _typeParametersAnnotation(classElement);
    final String typeParametersNames = _typeParametersNames(classElement);
    final String typeAnnotation = classElement.name + typeParametersNames;

    return '''
    extension ${classElement.name}CopyWith$typeParametersAnnotation on ${classElement.name}$typeParametersNames {
      ${_copyWithPart(typeAnnotation, sortedFields)}
    }
    ''';
  }

  String _typeParametersNames(ClassElement classElement) {
    final String names =
        classElement.typeParameters.map((e) => e.name).join(",");
    if (names.isNotEmpty) {
      return "<$names>";
    } else {
      return "";
    }
  }

  String _typeParametersAnnotation(ClassElement classElement) {
    final classDisplayString =
        classElement.getDisplayString(withNullability: false);
    final int startIndex = classDisplayString.indexOf("<");
    final int endIndex = classDisplayString.indexOf(">");

    if (startIndex != -1 && endIndex != -1) {
      return classDisplayString.substring(
        startIndex,
        endIndex + 1,
      );
    } else {
      return "";
    }
  }

  String _copyWithPart(
    String typeAnnotation,
    List<_FieldInfo> sortedFields,
  ) {
    final constructorInput = sortedFields.fold(
      "",
      (r, v) => "$r Value<${v.type}> ${v.name},",
    );
    final paramsInput = sortedFields.fold(
      "",
      (r, v) =>
          "$r ${v.name}: ${v.name} == null ? this.${v.name} : ${v.name}.value,",
    );

    return '''
        $typeAnnotation copyWith({$constructorInput}) {
          return $typeAnnotation($paramsInput);
        }
    ''';
  }

  List<_FieldInfo> _sortedConstructorFields(ClassElement element) {
    assert(element is ClassElement);

    final constructor = element.unnamedConstructor;
    if (constructor is! ConstructorElement) {
      throw "Default ${element.name} constructor is missing";
    }

    final parameters = constructor.parameters;
    if (parameters is! List<ParameterElement> || parameters.isEmpty) {
      throw "Unnamed constructor for ${element.name} has no parameters";
    }

    parameters.forEach((parameter) {
      if (!parameter.isNamed) {
        throw "Unnamed constructor for ${element.name} contains unnamed parameter. Only named parameters are supported.";
      }
    });

    final fields = parameters.map((v) => _FieldInfo(v)).toList();
    fields.sort((lhs, rhs) => lhs.name.compareTo(rhs.name));

    return fields;
  }
}

class _FieldInfo {
  final String name;
  final String type;

  _FieldInfo(ParameterElement element)
      : this.name = element.name,
        this.type = element.type.getDisplayString();
}
