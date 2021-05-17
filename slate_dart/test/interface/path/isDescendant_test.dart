import 'package:test/test.dart';
import 'package:slate_dart/slate_dart.dart';

void main () {
  test('interface->path->isDescendant->above', () {
    final path = [0];
    final another = [0, 1];
    final output = Path.isDescendant(path, another);
    expect(output, equals(false));
  });
  test('interface->path->isDescendant->after', () {
    final path = [1, 1, 2];
    final another = [0];
    final output = Path.isDescendant(path, another);
    expect(output, equals(false));
  });
  test('interface->path->isDescendant->before', () {
    final path = [0, 1, 2];
    final another = [1];
    final output = Path.isDescendant(path, another);
    expect(output, equals(false));
  });
  test('interface->path->isDescendant->below-child', () {
    final path = [0, 1];
    final another = [0];
    final output = Path.isDescendant(path, another);
    expect(output, equals(true));
  });
  test('interface->path->isDescendant->below-grandchild', () {
    final path = [0, 1];
    final another = <int>[];
    final output = Path.isDescendant(path, another);
    expect(output, equals(true));
  });
  test('interface->path->isDescendant->equal', () {
    final path = [0, 1, 2];
    final another = [0, 1, 2];
    final output = Path.isDescendant(path, another);
    expect(output, equals(false));
  });
}