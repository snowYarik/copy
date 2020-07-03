library copy;

class Copyable {
  const Copyable();
}

class Value<T> {
  const Value(this.value);

  final T value;
}
