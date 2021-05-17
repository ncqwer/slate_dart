import 'package:slate_dart/slate_dart.dart';

class Point {
  final List<int>? path;
  final int? offset;

  const Point({
    this.path,
    this.offset,
  });
  static int compare(Point lhs, Point rhs) {
    final result = Path.compare(lhs.path!, rhs.path!);
    if (result == 0) {
      if (lhs.offset! < rhs.offset!) return -1;
      if (lhs.offset! > rhs.offset!) return 1;
      return 0;
    }
    return result;
  }
}
