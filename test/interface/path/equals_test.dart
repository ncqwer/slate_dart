import 'package:test/test.dart';
import 'package:slate_dart/slate_dart.dart';

void main () {
  test('interface->path->equals->above', () {
    final path = [0, 1, 2];
    final another = [0];
    final output = Path.equals(path, another);
    expect(output, equals(false));
  });
  test('interface->path->equals->after', () {
    final path = [1, 1, 2];
    final another = [0];
    final output = Path.equals(path, another);
    expect(output, equals(false));
  });
  test('interface->path->equals->before', () {
    final path = [0, 1, 2];
    final another = [1];
    final output = Path.equals(path, another);
    expect(output, equals(false));
  });
  test('interface->path->equals->below', () {
    final path = [0];
    final another = [0, 1];
    final output = Path.equals(path, another);
    expect(output, equals(false));
  });
  test('interface->path->equals->equal', () {
    final path = [0, 1, 2];
    final another = [0, 1 ,2];
    final output = Path.equals(path, another);
    expect(output, equals(true));
  });
  test('interface->path->equals->root', () {
    final path = [0, 1, 2];
    final another = <int>[];
    final output = Path.equals(path, another);
    expect(output, equals(false));
  });
}