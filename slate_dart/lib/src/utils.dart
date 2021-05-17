import 'package:slate_dart/src/error.dart';

typedef VF<T> = T Function(T old);

T getValue<T>(T old, dynamic v) {
  if (v is T) return v;
  if (v is VF<T>) return v(old);
  throw SlateBaseException('getValue error');
}
