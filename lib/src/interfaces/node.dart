import 'package:slate_dart/src/error.dart';
import 'package:slate_dart/slate_dart.dart';

abstract class Descendant extends Node {}

abstract class Ancestor extends Node {
  abstract final List<Descendant> children;
}

class Text implements Descendant {
  final String text;

  @override
  Map<String, dynamic> data = {};

  Text({this.text = ''});
}

class Element implements Descendant, Ancestor {
  @override
  Map<String, dynamic> data = {};

  @override
  final List<Descendant> children;

  Element({required this.children});
}

class NodeEntry<T extends Node> {
  final List<int> path;
  final T node;
  const NodeEntry({required this.node, required this.path});
}

extension ListExtension<T> on List<T> {
  T? atIndex(int idx) {
    if (idx >= length) return null;
    return this[idx];
  }
}

abstract class Node {
  abstract Map<String, dynamic> data;

  static Ancestor ancestor(Node root, List<int> path) {
    final n = Node.getFromPath(root, path);
    if (n is Text) {
      throw SlateBaseException(
          'Cannot get the ancestor node at path [$path] because it refers to a text node instead: $n');
    }
    return n as Ancestor;
  }

  static Node getFromPath(Node root, List<int> path) {
    var node = root;

    for (var i = 0; i < path.length; ++i) {
      var p = path[i];

      if (node is Ancestor && !(node.children.atIndex(p) is Descendant)) {
        final n = node.children.atIndex(p);
        if (n is Descendant) {
          node = n;
          continue;
        }
      }
      throw SlateBaseException(
          'Cannot find a descendant at path [$path] in node:$node');
    }
    return node;
  }

  static bool has(Node root, List<int> path) {
    var node = root;
    for (var i = 0; i < path.length; ++i) {
      final p = path[i];
      if (node is Text) return false;
      if (node is Ancestor) {
        final n = node.children.atIndex(p);
        if (n != null) {
          node = n;
          continue;
        }
      }
      return false;
    }
    return true;
  }

  static NodeEntry last(Node root, List<int> path) {
    var n = Node.getFromPath(root, path);
    final p = List<int>.from(path);

    while (true) {
      if (n is Text) break;
      if (n is Ancestor) {
        if (n.children.isEmpty) break;
        p.add(n.children.length - 1);
        n = n.children.last;
      }
      break;
    }

    return NodeEntry(node: n, path: p);
  }

  static Text leaf(Node root, List<int> path) {
    final node = Node.getFromPath(root, path);
    if (node is Text) return node;
    throw SlateBaseException(
        'Cannot get the leaf node at path [$path] because it refers to a non-leaf node: $node');
  }

  static Iterable<NodeEntry> levels(Node root, List<int> path,
      {bool reverse = false}) sync* {
    final iter = Path.levels(path, reverse: reverse);
    for (final p in iter) {
      final n = Node.getFromPath(root, p);
      yield NodeEntry(node: n, path: p);
    }
  }

  static bool matches(Node node, Map<String, dynamic> props) {
    for (final i in props.entries) {
      final nodeValue = node.data[i.key];
      if (nodeValue == i.value) continue;
      return false;
    }
    return true;
  }

  static Iterable<NodeEntry> nodes(Node root,
      {List<int> from = const <int>[],
      List<int>? to,
      bool reverse = false,
      bool Function(NodeEntry)? pass}) sync* {
    final visited = <Node>{};
    var p = <int>[];
    var n = root;

    while (true) {
      if (to != null &&
          (reverse ? Path.isBefore(p, to) : Path.isAfter(p, to))) {
        break;
      }
      final hasCurrent = visited.contains(n);
      final nodeEntry = NodeEntry(node: n, path: p);
      if (!hasCurrent) {
        yield nodeEntry;
      }
      if (!hasCurrent &&
          n is Ancestor &&
          n.children.isNotEmpty &&
          (pass == null || !pass(nodeEntry))) {
        visited.add(n);
        var nextIdx = reverse ? n.children.length - 1 : 0;
        if (Path.isAncestor(p, from)) nextIdx = from[p.length];
        p = p.toList()..add(nextIdx);
        n = Node.getFromPath(root, p);
        continue;
      }

      if (p.isEmpty) break;

      if (!reverse) {
        final newPath = Path.next(p);
        if (Node.has(root, newPath)) {
          p = newPath;
          n = Node.getFromPath(root, p);
          continue;
        }
      }

      if (reverse && p.last != 0) {
        final newPath = Path.previous(p);
        p = newPath;
        n = Node.getFromPath(root, p);
        continue;
      }

      p = Path.parent(p);
      n = Node.getFromPath(root, p);
      visited.add(n);
    }
  }

  static Ancestor parent(Node root, List<int> path) {
    final parentPath = Path.parent(path);
    final p = Node.getFromPath(root, parentPath);

    if (p is Text) {
      throw SlateBaseException(
          'Cannot get the parent of path [$path] because it does not exist in the root.');
    }
    return p as Ancestor;
  }

  static String string(Node node) {
    if (node is Text) return node.text;
    if (node is Ancestor) return node.children.map(Node.string).join('');
    throw SlateBaseException(
        'Your custom Node[$node] should not implement Node directly.implement it either Element or Text');
  }

  static Iterable<NodeEntry> texts(Node root,
      {List<int> from = const <int>[],
      List<int>? to,
      bool reverse = false,
      bool Function(NodeEntry)? pass}) sync* {
    final iter =
        Node.nodes(root, from: from, to: to, reverse: reverse, pass: pass);
    for (final i in iter) {
      if (i.path is Text) yield NodeEntry(node: i.node, path: i.path);
    }
  }
}

// void main(List<String> args) {
//   final a = [1, 2, 3];
//   final b = a.toList()..add(4);
//   a[0] = 10;
//   print(b);
//   // print('$isElement, $isDescendant, $isAncestor');
// }
