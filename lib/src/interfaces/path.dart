import 'dart:math';

import 'package:slate_dart/src/error.dart';

// 暂时缺is&&transform

class Path {
  static int compare(List<int> lhs, List<int> rhs) {
    final minLength = min(lhs.length, rhs.length);
    for (var idx = 0; idx < minLength; ++idx) {
      if (lhs[idx] < rhs[idx]) return -1;
      if (lhs[idx] > rhs[idx]) return 1;
    }
    return 0;
  }

  static Iterable<List<int>> levels(List<int> path,
      {bool reverse = false}) sync* {
    final list = <List<int>>[];
    for (var count = 0; count <= path.length; ++count) {
      list.add(path.sublist(0, count));
    }
    if (reverse) {
      yield* list.reversed;
    } else {
      yield* list;
    }
  }

  static Iterable<List<int>> ancestors(List<int> path,
      {bool reverse = false}) sync* {
    final paths = List<List<int>>.from(levels(path, reverse: reverse));
    if (!reverse) yield* paths.sublist(0, max(paths.length - 1, 0));
    yield* paths.sublist(1);
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
      throw SlateBaseException(
          'Cannot get the next path of a root path [$path], because it has no next index.');
    }
    return path.sublist(0, path.length - 1)..add(path.last + 1);
  }

  static List<int> parent(List<int> path) {
    if (path.isEmpty) {
      throw SlateBaseException(
          'Cannot get the parent path of the root path [$path].');
    }
    return path.sublist(0, path.length - 1);
  }

  static List<int> previous(List<int> path) {
    if (path.isEmpty) {
      throw SlateBaseException(
          'Cannot get the previous path of a root path [$path], because it has no previous index.');
    }
    final last = path.last;
    if (last <= 0) {
      throw SlateBaseException(
          'Cannot get the previous path of a first child path [$path] because it would result in a negative index.');
    }
    return path.sublist(0, path.length - 1)..add(last - 1);
  }

  static List<int> relative(List<int> path, List<int> ancestor) {
    if (!Path.isAncestor(ancestor, path) && !Path.equals(path, ancestor)) {
      throw SlateBaseException(
          'Cannot get the relative path of [$path] inside ancestor [$ancestor], because it is not above or equal to the path.');
    }

    return path.sublist(ancestor.length);
  }

  // static
}

// void main() {
//   final a = [1, 2, 3, 4];
//   final b = a.sublist(1);
//   print('$a');
//   print('$b');
// }
