import 'package:slate_dart/slate_dart.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  test('interface->node->ancestors->reverse', () {
    final e = Editor(children: [
      Element(children: [Text()])
    ]);
    final ancestors =
        List<NodeEntry>.from(Node.ancestors(e, [0, 0], reverse: true));
    expect(
        ancestors,
        equals([
          NodeEntry(
            node: e.children[0] as Ancestor,
            path: [0],
          ),
          NodeEntry(
            // ignore: unnecessary_cast
            node: e as Ancestor,
            path: [],
          )
        ]));
  });
  test('interface->node->ancestors->success', () {
    final e = Editor(children: [
      Element(children: [Text()])
    ]);
    final ancestors = List<NodeEntry>.from(Node.ancestors(e, [0, 0]));
    expect(
        ancestors,
        equals([
          NodeEntry(
            // ignore: unnecessary_cast
            node: e as Ancestor,
            path: [],
          ),
          NodeEntry(
            node: e.children[0] as Ancestor,
            path: [0],
          ),
        ]));
  });
}
