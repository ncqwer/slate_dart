class SlateBaseException implements Exception {
  final String message;
  SlateBaseException(String msg) : message = msg;
}

// typedef VF<T> = T Function(T old);

// T getValue<T>(T old, dynamic v) {
//   if (v is T) return v;
//   if (v is VF<T>) return v(old);
//   return old;
// }

// class Text1 {
//   final String a;
//   final int b;

//   const Text1({required this.a, required this.b});

//   Text1.from(Text1 another, {dynamic a, dynamic b})
//       : a = getValue(another.a, a),
//         b = getValue(another.b, b);
// }

// final h = Text1(a: 'hh', b: 1);
// final h_copy = Text1.from(h, a: (v) => v + 'h', b: (v) => v + 1);
