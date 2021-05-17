import 'package:test/test.dart';
import 'package:slate_dart/slate_dart.dart';

void main () {
  test('interface->path->relative->grandparent', () {
    final path = [0, 1, 2];
    final another = [0];
    final output = Path.relative(path, another);
    expect(output, equals([1, 2]));
  });
  test('interface->path->relative->parent', () {
    final path = [0, 1];
    final another = [0];
    final output = Path.relative(path, another);
    expect(output, equals([1]));
  });
  test('interface->path->relative->root', () {
    final path = [0, 1];
    final another = <int>[];
    final output = Path.relative(path, another);
    expect(output, equals([0, 1]));
  });
}