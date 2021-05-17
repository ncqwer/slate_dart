import 'package:test/test.dart';
import 'package:slate_dart/slate_dart.dart';

void main () {
  test('interface->path->isBefore->above', () {
    final path = [0];
    final another = [0, 1];
    final output = Path.isBefore(path, another);
    expect(output, equals(false));
  });
  test('interface->path->isBefore->after', () {
    final path = [1, 1, 2];
    final another = [0];
    final output = Path.isBefore(path, another);
    expect(output, equals(false));
  });
  test('interface->path->isBefore->before', () {
    final path = [0, 1, 2];
    final another = [1];
    final output = Path.isBefore(path, another);
    expect(output, equals(true));
  });
  test('interface->path->isBefore->below', () {
    final path = [0, 1, 2];
    final another = [0];
    final output = Path.isBefore(path, another);
    expect(output, equals(false));
  });
  test('interface->path->isBefore->equal', () {
    final path = [0, 1, 2];
    final another = [0, 1, 2];
    final output = Path.isBefore(path, another);
    expect(output, equals(false));
  });
}