import 'package:test/test.dart';
import 'package:slate_dart/slate_dart.dart';

void main() {
  test('interface->node->child->success', () {
    final e = Editor(children: [
      Element(children: [
        Text(),
      ])
    ]);
    final ancestor = Node.child(e, 0);
    expect(ancestor, equals(e.children[0]));
  });
}
