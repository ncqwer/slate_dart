import 'package:test/test.dart';
import 'package:slate_dart/slate_dart.dart';

void main() {
  test('interface->node->leaf->reverse', () {
    final e = Editor(children: [
      Element(children: [
        Text(key: 'a'),
        Text(key: 'b'),
      ])
    ]);
    final leaf = Node.levels(e, [0, 0], reverse: true);
    expect(
        leaf,
        // ignore: unnecessary_cast
        equals([
          // ignore: unnecessary_cast
          NodeEntry(node: Text(key: 'a') as Node, path: [0, 0]),
          // ignore: unnecessary_cast
          NodeEntry(node: e.children[0] as Node, path: [0]),
          // ignore: unnecessary_cast
          NodeEntry(node: e as Node, path: [])
        ]));
  });

  test('interface->node->leaf->success', () {
    final e = Editor(children: [
      Element(children: [
        Text(key: 'a'),
        Text(key: 'b'),
      ])
    ]);
    final leaf = Node.levels(e, [0, 0]);
    expect(
        leaf,
        // ignore: unnecessary_cast
        equals([
          // ignore: unnecessary_cast
          NodeEntry(node: e as Node, path: []),
          // ignore: unnecessary_cast
          NodeEntry(node: e.children[0] as Node, path: [0]),
          // ignore: unnecessary_cast
          NodeEntry(node: Text(key: 'a') as Node, path: [0, 0]),
        ]));
  });
}
