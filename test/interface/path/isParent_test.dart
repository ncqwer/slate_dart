import 'package:test/test.dart';
import 'package:slate_dart/slate_dart.dart';

void main () {
  test('interface->path->isParent->above-grandparent', () {
    final path = <int>[];
    final another = [0, 1];
    final output = Path.isParent(path, another);
    expect(output, equals(false));
  });
  test('interface->path->isParent->above-parent', () {
    final path = [0];
    final another = [0, 1];
    final output = Path.isParent(path, another);
    expect(output, equals(true));
  });
  test('interface->path->isParent->after', () {
    final path = [1, 1, 2];
    final another = [0];
    final output = Path.isParent(path, another);
    expect(output, equals(false));
  });
  test('interface->path->isParent->before', () {
    final path = [0, 1, 2];
    final another = [1];
    final output = Path.isParent(path, another);
    expect(output, equals(false));
  });
  test('interface->path->isParent->below', () {
    final path = [0, 1, 2];
    final another = [0];
    final output = Path.isParent(path, another);
    expect(output, equals(false));
  });
  test('interface->path->isParent->equal', () {
    final path = [0, 1, 2];
    final another = [0, 1, 2];
    final output = Path.isParent(path, another);
    expect(output, equals(false));
  });
}