import 'package:test/test.dart';
import 'package:slate_dart/slate_dart.dart';

void main() {
  test('interface->node->descendant->success', () {
    final e = Editor(children: [
      Element(children: [
        Text(),
      ])
    ]);
    final descendant = Node.descendant(e, [0]);
    expect(descendant, equals(e.children[0]));
  });
}
