// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sub_class.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

extension BasicBaseClassCopyWith on BasicBaseClass {
  BasicBaseClass copyWith({
    Value<String> id,
  }) {
    return BasicBaseClass(
      id: id == null ? this.id : id.value,
    );
  }
}

extension BasicBaseSubClassCopyWith<T> on BasicBaseSubClass<T> {
  BasicBaseSubClass<T> copyWith({
    Value<String> id,
    Value<T> item,
  }) {
    return BasicBaseSubClass<T>(
      id: id == null ? this.id : id.value,
      item: item == null ? this.item : item.value,
    );
  }
}

extension SubClassCopyWith<T, U extends String> on SubClass<T, U> {
  SubClass<T, U> copyWith({
    Value<String> aString,
    Value<DateTime> date,
    Value<String> id,
    Value<T> item,
    Value<List<T>> listWithGenericType,
    Value<List<int>> listWithType,
    Value<List<Iterable<U>>> listWithTypedType,
    Value<String> privateField,
  }) {
    return SubClass<T, U>(
      aString: aString == null ? this.aString : aString.value,
      date: date == null ? this.date : date.value,
      id: id == null ? this.id : id.value,
      item: item == null ? this.item : item.value,
      listWithGenericType: listWithGenericType == null
          ? this.listWithGenericType
          : listWithGenericType.value,
      listWithType:
          listWithType == null ? this.listWithType : listWithType.value,
      listWithTypedType: listWithTypedType == null
          ? this.listWithTypedType
          : listWithTypedType.value,
      privateField:
          privateField == null ? this.privateField : privateField.value,
    );
  }
}
