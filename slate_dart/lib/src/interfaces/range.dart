import 'package:slate_dart/slate_dart.dart';
import 'package:slate_dart/src/error.dart';
import 'package:slate_dart/src/utils.dart';

class PointTuple {
  final Point begin;
  final Point end;

  const PointTuple({required this.begin, required this.end});
}

class Range {
  final Point anchor;
  final Point focus;

  Map<String, dynamic>? data;

  Range({required this.anchor, required this.focus, this.data});

  Range.from(Range range, {dynamic anchor, dynamic focus, dynamic data})
      : anchor = getValue(range.anchor, anchor),
        focus = getValue(range.focus, focus),
        data = getValue(range.data, data);

  static PointTuple edges(Range range, {bool reverse = false}) {
    return Range.isBackward(range) == reverse
        ? PointTuple(begin: range.anchor, end: range.focus)
        : PointTuple(begin: range.focus, end: range.anchor);
  }

  static Point end(Range range) => Range.edges(range).end;
  static Point begin(Range range) => Range.edges(range).begin;

  static bool equals(Range lhs, Range rhs) =>
      Point.equals(lhs.anchor, rhs.anchor) &&
      Point.equals(lhs.focus, rhs.focus);

  static bool includes(Range range, dynamic target) {
    if (target is Range) {
      if (Range.includes(range, target.anchor) ||
          Range.includes(range, target.focus)) {
        return true;
      }
      final re = Range.edges(range);
      final te = Range.edges(range);
      return Point.isBefore(re.begin, te.begin) &&
          Point.isAfter(re.end, te.end);
    }
    final re = Range.edges(range);
    if (target is Point) {
      return Point.compare(target, re.begin) >= 0 &&
          Point.compare(target, re.end) <= 0;
    }
    if (target is List<int>) {
      return Path.compare(target, re.begin.path) >= 0 &&
          Path.compare(target, re.end.path) <= 0;
    }
    throw SlateBaseException(
        'target[${target.runtimeType}] only support [Path]|[Point]|[Range] type');
  }

  static Range? intersection(Range range, Range another) {
    final re = Range.edges(range);
    final ae = Range.edges(another);
    final begin = Point.isBefore(re.begin, ae.begin) ? re.begin : ae.begin;
    final end = Point.isAfter(re.end, ae.end) ? re.end : ae.end;

    if (Point.isBefore(end, begin)) return null;
    return Range.from(range, anchor: begin, focus: end);
  }

  static bool isBackward(Range range) {
    return Point.isAfter(range.anchor, range.focus);
  }

  static bool isCollapsed(Range range) =>
      Point.equals(range.anchor, range.focus);

  static bool isExpanded(Range range) => !Range.isCollapsed(range);

  static bool isForward(Range range) => !Range.isBackward(range);

  static Iterable<Point> points(Range range) sync* {
    yield range.anchor;
    yield range.focus;
  }
}
