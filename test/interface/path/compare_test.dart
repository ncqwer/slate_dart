import 'package:test/test.dart';
import 'package:slate_dart/slate_dart.dart';

void main() {
  test('interface->path->compare->above', () {
    final path = [0, 1, 2];
    final another = [0];
    final output = Path.compare(path, another);
    expect(output, equals(0));
  });

  test('interface->path->compare->after', () {
    final path = [1, 1, 2];
    final another = [0];
    final output = Path.compare(path, another);
    expect(output, equals(1));
  });

  test('interface->path->compare->before', () {
    final path = [0, 1, 2];
    final another = [1];
    final output = Path.compare(path, another);
    expect(output, equals(-1));
  });

  test('interface->path->compare->below', () {
    final path = [
      0,
    ];
    final another = [0, 1];
    final output = Path.compare(path, another);
    expect(output, equals(0));
  });

  test('interface->path->compare->below', () {
    final path = [0, 1, 2];
    final another = [0, 1, 2];
    final output = Path.compare(path, another);
    expect(output, equals(0));
  });

  test('interface->path->compare->root', () {
    final path = [0, 1, 2];
    final another = <int>[];
    final output = Path.compare(path, another);
    expect(output, equals(0));
  });
}
