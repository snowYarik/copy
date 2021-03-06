library copy;

class Copyable {
  const Copyable();
}

class Value<T> {
  const Value(this.value);

  final T value;
}

extension ValueExtension<T> on T {
  Value<T> get value {
    return Value(this);
  }
}
