import 'package:test/test.dart';
import 'package:slate_dart/slate_dart.dart';

void main() {
  test('interface->node->leaf->success', () {
    final e = Editor(children: [
      Element(children: [
        Text(key: 'a'),
      ])
    ]);
    final parent = Node.parent(e, [0, 0]);
    expect(
        parent,
        // ignore: unnecessary_cast
        equals(e.children[0]));
  });
}
