import 'package:test/test.dart';
import 'package:slate_dart/slate_dart.dart';

void main() {
  test('interface->node->getFromPath->root', () {
    final e = Editor(children: [
      Element(children: [
        Text(key: 'a'),
      ])
    ]);
    final root = Node.getFromPath(e, []);
    expect(
        root,
        // ignore: unnecessary_cast
        equals(e));
  });

  test('interface->node->getFromPath->success', () {
    final e = Editor(children: [
      Element(children: [
        Text(key: 'a'),
      ])
    ]);
    final root = Node.getFromPath(e, [0]);
    expect(
        root,
        // ignore: unnecessary_cast
        equals(e.children[0]));
  });
}
