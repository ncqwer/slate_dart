import 'package:test/test.dart';
import 'package:slate_dart/slate_dart.dart';

void main () {
  test('interface->path->isChild->above', () {
    final path = [0];
    final another = [0, 1];
    final output = Path.isChild(path, another);
    expect(output, equals(false));
  });
  test('interface->path->isChild->after', () {
    final path = [1, 1, 2];
    final another = [0];
    final output = Path.isChild(path, another);
    expect(output, equals(false));
  });
  test('interface->path->isChild->before', () {
    final path = [0, 1, 2];
    final another = [1];
    final output = Path.isChild(path, another);
    expect(output, equals(false));
  });
  test('interface->path->isChild->before-child', () {
    final path = [0, 1];
    final another = [0];
    final output = Path.isChild(path, another);
    expect(output, equals(true));
  });
  test('interface->path->isChild->before-grandchild', () {
    final path = [0, 1];
    final another = <int>[];
    final output = Path.isChild(path, another);
    expect(output, equals(false));
  });
  test('interface->path->isChild->equal', () {
    final path = [0, 1, 2];
    final another = [0, 1, 2];
    final output = Path.isChild(path, another);
    expect(output, equals(false));
  });
}