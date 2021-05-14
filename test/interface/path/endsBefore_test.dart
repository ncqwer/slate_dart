import 'package:test/test.dart';
import 'package:slate_dart/slate_dart.dart';

void main () {
  test('interface->path->endsBefore->above', () {
    final path = [0, 1, 2];
    final another = [0];
    final output = Path.endsBefore(path, another);
    expect(output, equals(false));
  });
  test('interface->path->endsBefore->after', () {
    final path = [0, 1, 2];
    final another = [0];
    final output = Path.endsBefore(path, another);
    expect(output, equals(false));
  });
  test('interface->path->endsBefore->before', () {
    final path = [0, 1, 2];
    final another = [1];
    final output = Path.endsBefore(path, another);
    expect(output, equals(false));
  });
  test('interface->path->endsBefore->below', () {
    final path = [0];
    final another = [0, 1];
    final output = Path.endsBefore(path, another);
    expect(output, equals(false));
  });
  test('interface->path->endsBefore->ends-after', () {
    final path = [1];
    final another = [0, 2];
    final output = Path.endsBefore(path, another);
    expect(output, equals(false));
  });
  test('interface->path->endsBefore->ends-at', () {
    final path = [0];
    final another = [0, 2];
    final output = Path.endsBefore(path, another);
    expect(output, equals(false));
  });
  test('interface->path->endsBefore->ends-before', () {
    final path = [0];
    final another = [1, 2];
    final output = Path.endsBefore(path, another);
    expect(output, equals(true));
  });
  test('interface->path->endsBefore->equal', () {
    final path = [0, 1, 2];
    final another = [0, 1, 2];
    final output = Path.endsBefore(path, another);
    expect(output, equals(false));
  });
  test('interface->path->endsBefore->root', () {
    final path = [0, 1, 2];
    final another = <int>[];
    final output = Path.endsBefore(path, another);
    expect(output, equals(false));
  });
}