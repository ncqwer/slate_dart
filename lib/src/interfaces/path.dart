import 'dart:math';

import 'package:slate_dart/src/error.dart';

class Path {
  static int compare(List<int> lhs, List<int> rhs) {
    final minLength = min(lhs.length, rhs.length);
    for (var idx = 0; idx < minLength; ++idx) {
      if (lhs[idx] < rhs[idx]) return -1;
      if (lhs[idx] > rhs[idx]) return 1;
    }
    return 0;
  }

  static List<List<int>> levels(List<int> path, {bool reverse = false}) {
    final list = <List<int>>[];
    for (var count = 0; count <= path.length; ++count) {
      list.add(path.sublist(0, count));
    }
    return reverse ? List<List<int>>.from(list.reversed) : list;
  }

  static List<List<int>> ancestors(List<int> path, {bool reverse = false}) {
    final paths = levels(path, reverse: reverse);
    if (!reverse) return paths.sublist(0, max(paths.length - 1, 0));
    return paths.sublist(1);
  }

  static List<int> common(List<int> path, List<int> another) {
    final common = <int>[];
    for (var i = 0; i < path.length && i < another.length; ++i) {
      final av = path[i];
      final bv = another[i];

      if (av != bv) break;
      common.add(av);
    }
    return common;
  }

  static bool equals(List<int> path, List<int> another) {
    var i = -1;
    return (path.length == another.length &&
        path.every((element) {
          ++i;
          return element == another[i];
        }));
  }

  static bool endsAfter(List<int> path, List<int> another) {
    final i = path.length - 1;
    final ap = path.sublist(0, i);
    final bp = another.sublist(0, i);
    final av = path[i];
    final bv = another[i];
    return Path.equals(ap, bp) && av > bv;
  }

  static bool endsAt(List<int> path, List<int> another) {
    return Path.equals(path, another.sublist(0, path.length));
  }

  static bool endsBefore(List<int> path, List<int> another) {
    final i = path.length - 1;
    final ap = path.sublist(0, i);
    final bp = another.sublist(0, i);
    final av = path[i];
    final bv = another[i];
    return Path.equals(ap, bp) && av < bv;
  }

  static bool isAfter(List<int> path, List<int> another) {
    return Path.compare(path, another) == 1;
  }

  static bool isAncestor(List<int> path, List<int> another) {
    return path.length < another.length && Path.compare(path, another) == 0;
  }

  static bool isBefore(List<int> path, List<int> another) {
    return Path.compare(path, another) == -1;
  }

  static bool isChild(List<int> path, List<int> another) {
    return path.length == another.length + 1 &&
        Path.compare(path, another) == 0;
  }

  static bool isCommon(List<int> path, List<int> another) {
    return path.length <= another.length && Path.compare(path, another) == 0;
  }

  static bool isDescendant(
    List<int> path,
    List<int> another,
  ) {
    return path.length > another.length && Path.compare(path, another) == 0;
  }

  static bool isParent(List<int> path, List<int> another) {
    return path.length + 1 == another.length &&
        Path.compare(path, another) == 0;
  }

  // static bool isPath()

  static bool isSibling(List<int> path, List<int> another) {
    if (path.length != another.length) return false;
    final ap = path.sublist(0, max(path.length - 1, 0));
    final bp = another.sublist(0, max(another.length - 1, 0));
    return path.last != another.last && Path.equals(ap, bp);
  }

  static List<int> next(List<int> path) {
    if (path.isEmpty) {
      throw SlateBaseError(
          'Cannot get the next path of a root path [$path], because it has no next index.');
    }
    return path.sublist(0, path.length - 1)..add(path.last + 1);
  }
}

// void main() {
//   final a = [1, 2, 3, 4];
//   final b = a.sublist(1);
//   print('$a');
//   print('$b');
// }
