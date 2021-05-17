import 'package:test/test.dart';
import 'package:slate_dart/slate_dart.dart';

void main() {
  test('interface->node->texts->all', () {
    final e = Editor(children: [
      Element(children: [
        Text(key: 'a'),
        Text(key: 'b'),
      ])
    ]);
    final ts = List<NodeEntry>.from(Node.texts(e));
    expect(
        ts,
        equals([
          // ignore: unnecessary_cast
          NodeEntry(node: Text(key: 'a') as Node, path: [0, 0]),
          // ignore: unnecessary_cast
          NodeEntry(node: Text(key: 'b') as Node, path: [0, 1]),
        ]));
  });

  test('interface->node->texts->from', () {
    final e = Editor(children: [
      Element(children: [
        Text(key: 'a'),
        Text(key: 'b'),
      ])
    ]);
    final ts = List<NodeEntry>.from(Node.texts(e, from: [0, 1]));
    expect(
        ts,
        equals([
          // NodeEntry(node: Text(key: 'a') as Node, path: [0, 0]),
          // ignore: unnecessary_cast
          NodeEntry(node: Text(key: 'b') as Node, path: [0, 1]),
        ]));
  });

  test('interface->node->texts->muti-elements', () {
    final e = Editor(children: [
      Element(children: [
        Text(key: 'a'),
      ]),
      Element(children: [
        Text(key: 'b'),
      ])
    ]);
    final ts = List<NodeEntry>.from(Node.texts(e));
    expect(
        ts,
        equals([
          // ignore: unnecessary_cast
          NodeEntry(node: Text(key: 'a') as Node, path: [0, 0]),
          // ignore: unnecessary_cast
          NodeEntry(node: Text(key: 'b') as Node, path: [1, 0]),
        ]));
  });
  test('interface->node->texts->reverse', () {
    final e = Editor(children: [
      Element(children: [
        Text(key: 'a'),
        Text(key: 'b'),
      ])
    ]);
    final ts = List<NodeEntry>.from(Node.texts(e, reverse: true));
    expect(
        ts,
        equals([
          // ignore: unnecessary_cast
          NodeEntry(node: Text(key: 'b') as Node, path: [0, 1]),
          // ignore: unnecessary_cast
          NodeEntry(node: Text(key: 'a') as Node, path: [0, 0]),
        ]));
  });

  test('interface->node->texts->to', () {
    final e = Editor(children: [
      Element(children: [
        Text(key: 'a'),
        Text(key: 'b'),
        Text(key: 'c'),
        Text(key: 'd'),
      ])
    ]);
    final ts = List<NodeEntry>.from(Node.texts(e, from: [0, 1], to: [0, 2]));
    expect(
        ts,
        equals([
          // ignore: unnecessary_cast
          NodeEntry(node: Text(key: 'b') as Node, path: [0, 1]),
          // ignore: unnecessary_cast
          NodeEntry(node: Text(key: 'c') as Node, path: [0, 2]),
        ]));
  });
}
