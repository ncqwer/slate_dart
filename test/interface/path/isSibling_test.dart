import 'package:test/test.dart';
import 'package:slate_dart/slate_dart.dart';


void main () {
  test('interface->path->isSibling->above', () {
    final path = <int>[];
    final another = [0, 1];
    final output = Path.isSibling(path, another);
    expect(output, equals(false));
  });
  test('interface->path->isSibling->after-sibling', () {
    final path = [1, 4];
    final another = [1, 2];
    final output = Path.isSibling(path, another);
    expect(output, equals(true));
  });
  test('interface->path->isSibling->after', () {
    final path = [1, 2];
    final another = [0];
    final output = Path.isSibling(path, another);
    expect(output, equals(false));
  });
  test('interface->path->isSibling->before-sibling', () {
    final path = [0, 1];
    final another = [0, 3];
    final output = Path.isSibling(path, another);
    expect(output, equals(true));
  });
  test('interface->path->isSibling->before', () {
    final path = [0, 2];
    final another = [1];
    final output = Path.isSibling(path, another);
    expect(output, equals(false));
  });
  test('interface->path->isSibling->below', () {
    final path = [0, 2];
    final another = [0];
    final output = Path.isSibling(path, another);
    expect(output, equals(false));
  });
  test('interface->path->isSibling->equal', () {
    final path = [0, 1];
    final another = [0, 1];
    final output = Path.isSibling(path, another);
    expect(output, equals(false));
  });
}