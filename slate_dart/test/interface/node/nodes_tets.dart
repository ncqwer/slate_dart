import 'package:test/test.dart';
import 'package:slate_dart/slate_dart.dart';

void main() {
  test('interface->node->nodes->all', () {
    final e = Editor(children: [
      Element(children: [
        Text(key: 'a'),
        Text(key: 'b'),
      ])
    ]);
    final ns = List<NodeEntry>.from(Node.nodes(e));
    expect(
        ns,
        // ignore: unnecessary_cast
        equals([
          // ignore: unnecessary_cast
          NodeEntry(node: e as Node, path: []),
          // ignore: unnecessary_cast
          NodeEntry(node: e.children[0] as Node, path: [0]),
          // ignore: unnecessary_cast
          NodeEntry(node: Text(key: 'a') as Node, path: [0, 0]),
          // ignore: unnecessary_cast
          NodeEntry(node: Text(key: 'b') as Node, path: [0, 1]),
        ]));
  });

  test('interface->node->nodes->muti-elements', () {
    final e = Editor(children: [
      Element(children: [
        Text(key: 'a'),
      ]),
      Element(children: [
        Text(key: 'b'),
      ])
    ]);
    final ns = List<NodeEntry>.from(Node.nodes(e));
    expect(
        ns,
        // ignore: unnecessary_cast
        equals([
          // ignore: unnecessary_cast
          NodeEntry(node: e as Node, path: []),
          // ignore: unnecessary_cast
          NodeEntry(node: e.children[0] as Node, path: [0]),
          // ignore: unnecessary_cast
          NodeEntry(node: Text(key: 'a') as Node, path: [0, 0]),
          // ignore: unnecessary_cast
          NodeEntry(node: e.children[1] as Node, path: [1]),
          // ignore: unnecessary_cast
          NodeEntry(node: Text(key: 'b') as Node, path: [1, 0]),
        ]));
  });

  test('interface->node->nodes->nested-elements', () {
    final e = Editor(children: [
      Element(children: [
        Element(children: [
          Text(key: 'a'),
        ]),
      ]),
    ]);
    final ns = List<NodeEntry>.from(Node.nodes(e));
    expect(
        ns,
        // ignore: unnecessary_cast
        equals([
          // ignore: unnecessary_cast
          NodeEntry(node: e as Node, path: []),
          // ignore: unnecessary_cast
          NodeEntry(node: e.children[0] as Node, path: [0]),
          // ignore: unnecessary_cast
          NodeEntry(
              node: (e.children[0] as Ancestor).children[0] as Node,
              path: [0, 0]),
          // ignore: unnecessary_cast
          NodeEntry(node: Text(key: 'a') as Node, path: [0, 0, 0]),
        ]));
  });

  test('interface->node->nodes->pass', () {
    final e = Editor(children: [
      Element(children: [
        Element(children: [
          Text(key: 'a'),
        ]),
      ]),
    ]);
    final ns = List<NodeEntry>.from(
        Node.nodes(e, pass: (entry) => entry.path.length > 1));
    expect(
        ns,
        // ignore: unnecessary_cast
        equals([
          // ignore: unnecessary_cast
          NodeEntry(node: e as Node, path: []),
          // ignore: unnecessary_cast
          NodeEntry(node: e.children[0] as Node, path: [0]),
          NodeEntry(
              // ignore: unnecessary_cast
              node: (e.children[0] as Ancestor).children[0] as Node,
              path: [0, 0]),
          // ignore: unnecessary_cast
        ]));
  });

  test('interface->node->nodes->to', () {
    final e = Editor(children: [
      Element(children: [
        Text(key: 'a'),
        Text(key: 'b'),
        Text(key: 'c'),
        Text(key: 'd'),
      ]),
    ]);
    final ns = List<NodeEntry>.from(Node.nodes(e, from: [0, 1], to: [0, 2]));
    expect(
        ns,
        // ignore: unnecessary_cast
        equals([
          // ignore: unnecessary_cast
          NodeEntry(node: e as Node, path: []),
          // ignore: unnecessary_cast
          NodeEntry(node: e.children[0] as Node, path: [0]),
          // ignore: unnecessary_cast
          NodeEntry(node: Text(key: 'b') as Node, path: [0, 1]),
          // ignore: unnecessary_cast
          NodeEntry(node: Text(key: 'c') as Node, path: [0, 2]),
        ]));
  });
}
