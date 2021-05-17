import 'package:test/test.dart';
import 'package:slate_dart/slate_dart.dart';

void main() {
  test('interface->node->children->all', () {
    final e = Editor(children: [
      Element(children: [
        Text(key: 'a'),
        Text(key: 'b'),
      ])
    ]);
    final children = List<NodeEntry>.from(Node.children(e, [0]));
    expect(
        children,
        equals([
          // ignore: unnecessary_cast
          NodeEntry(node: Text(key: 'a') as Node, path: [0, 0]),
          // ignore: unnecessary_cast
          NodeEntry(node: Text(key: 'b') as Node, path: [0, 1]),
        ]));
  });

  test('interface->node->children->reverse', () {
    final e = Editor(children: [
      Element(children: [
        Text(key: 'a'),
        Text(key: 'b'),
      ])
    ]);
    final children = List<NodeEntry>.from(
      Node.children(e, [0], reverse: true),
    );
    expect(
        children,
        equals([
          // ignore: unnecessary_cast
          NodeEntry(node: Text(key: 'b') as Node, path: [0, 1]),
          // ignore: unnecessary_cast
          NodeEntry(node: Text(key: 'a') as Node, path: [0, 0]),
        ]));
  });
}
