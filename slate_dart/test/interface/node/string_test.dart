import 'package:test/test.dart';
import 'package:slate_dart/slate_dart.dart';

void main() {
  test('interface->node->string->accorss-elements', () {
    final e = Editor(children: [
      Element(children: [
        Text(text: 'one'),
        Text(text: 'two'),
      ]),
      Element(children: [
        Text(text: 'three'),
        Text(text: 'four'),
      ])
    ]);
    final str = Node.string(e);
    expect(
        str,
        // ignore: unnecessary_cast
        equals('onetwothreefour'));
  });

  test('interface->node->string->text', () {
    final e = Text(text: 'one');
    final str = Node.string(e);
    expect(
        str,
        // ignore: unnecessary_cast
        equals('one'));
  });
}
