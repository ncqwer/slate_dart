import 'package:test/test.dart';
import 'package:slate_dart/slate_dart.dart';

void main() {
  test('interface->node->elements->all', () {
    final e = Editor(children: [
      Element(children: [
        Text(key: 'a'),
        Text(key: 'b'),
      ])
    ]);
    final children = List<NodeEntry<Element>>.from(
      Node.elements(e),
    );
    expect(
        children,
        equals([
          // ignore: unnecessary_cast
          NodeEntry(node: e.children[0] as Element, path: [0]),
        ]));
  });

  test('interface->node->elements->path', () {
    final e = Editor(children: [
      Element(children: [
        Text(key: 'a'),
        Text(key: 'b'),
      ])
    ]);
    final children = List<NodeEntry>.from(Node.descendants(e, from: [0, 1]));
    expect(
        children,
        equals([
          // ignore: unnecessary_cast
          NodeEntry(node: e.children[0] as Descendant, path: [0]),
          // ignore: unnecessary_cast
          // NodeEntry(node: Text(key: 'a') as Node, path: [0, 0]),
          // ignore: unnecessary_cast
          NodeEntry(node: Text(key: 'b') as Descendant, path: [0, 1]),
        ]));
  });

  test('interface->node->descendants->reverse', () {
    final e = Editor(children: [
      Element(children: [
        Text(key: 'a'),
        Text(key: 'b'),
      ])
    ]);
    final children = List<NodeEntry>.from(Node.descendants(e, reverse: true));
    expect(
        children,
        equals([
          // ignore: unnecessary_cast
          NodeEntry(node: e.children[0] as Descendant, path: [0]),
          // ignore: unnecessary_cast
          NodeEntry(node: Text(key: 'b') as Descendant, path: [0, 1]),
          // ignore: unnecessary_cast
          NodeEntry(node: Text(key: 'a') as Descendant, path: [0, 0]),
        ]));
  });

  test('interface->node->descendants->to', () {
    final e = Editor(children: [
      Element(children: [
        Text(key: 'a'),
        Text(key: 'b'),
        Text(key: 'c'),
        Text(key: 'd'),
      ])
    ]);
    final children =
        List<NodeEntry>.from(Node.descendants(e, from: [0, 1], to: [0, 2]));
    expect(
        children,
        equals([
          // ignore: unnecessary_cast
          NodeEntry(node: e.children[0] as Descendant, path: [0]),
          // ignore: unnecessary_cast
          NodeEntry(node: Text(key: 'b') as Descendant, path: [0, 1]),
          // ignore: unnecessary_cast
          NodeEntry(node: Text(key: 'c') as Descendant, path: [0, 2]),
        ]));
  });
}
