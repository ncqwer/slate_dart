import 'package:test/test.dart';
import 'package:slate_dart/slate_dart.dart';

void main() {
  test('interface->node->leaf->success', () {
    final e = Editor(children: [
      Element(children: [
        Text(key: 'a'),
      ])
    ]);
    final leaf = Node.leaf(e, [0, 0]);
    expect(
        leaf,
        // ignore: unnecessary_cast
        equals(Text(key: 'a')));
  });
}
