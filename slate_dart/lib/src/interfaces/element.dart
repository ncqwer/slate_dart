import 'package:slate_dart/slate_dart.dart';

class Element implements Descendant, Ancestor {
  @override
  Map<String, dynamic> data;
  @override
  String? key;

  @override
  final List<Descendant> children;

  Element({required this.children, this.key, this.data = const {}});

  @override
  bool operator ==(dynamic another) {
    // assert(debugAssertIsValid());
    if (identical(this, another)) return true;
    if (another.runtimeType != runtimeType) return false;
    if (key != null && another.key != null && key == another.key) return true;
    return false;
  }

  static bool matches(Element element, Map<String, dynamic> props) {
    final data = element.data;
    for (final e in props.entries) {
      if (data[e.key] != e.value) return false;
    }
    return true;
  }
}
