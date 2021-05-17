import 'package:test/test.dart';
import 'package:slate_dart/slate_dart.dart';

void main() {
  test('interface->node->first->success', () {
    final e = Editor(children: [
      Element(children: [
        Text(key: 'a'),
        Text(key: 'b'),
      ])
    ]);
    final nodeEntry = Node.first(e, [0]);
    expect(
        nodeEntry,
        // ignore: unnecessary_cast
        equals(NodeEntry(node: Text(key: 'a') as Node, path: [0, 0])));
  });
}
