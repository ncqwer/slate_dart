import 'package:test/test.dart';
import 'package:slate_dart/slate_dart.dart';

void main() {
  
  test('interface->path->endsAt->above', () {
    final path = [0, 1, 2];
    final another = [0];
    final output = Path.endsAt(path, another);
    expect(output, equals(false));
  });
  test('interface->path->endsAt->after', () {
    final path = [1, 1, 2];
    final another = [0];
    final output = Path.endsAt(path, another);
    expect(output, equals(false));
  });
  test('interface->path->endsAt->before', () {
    final path = [0, 1, 2];
    final another = [1];
    final output = Path.endsAt(path, another);
    expect(output, equals(false));
  });
  test('interface->path->endsAt->ends-after', () {
    final path = [1];
    final another = [0, 2];
    final output = Path.endsAt(path, another);
    expect(output, equals(false));
  });
  test('interface->path->endsAt->ends-at', () {
    final path = [0];
    final another = [0, 2];
    final output = Path.endsAt(path, another);
    expect(output, equals(true));
  });
  test('interface->path->endsAt->ends-before', () {
    final path = [0];
    final another = [1, 2];
    final output = Path.endsAt(path, another);
    expect(output, equals(false));
  });
  test('interface->path->endsAt->equal', () {
    final path = [0, 1, 2];
    final another = [0, 1, 2];
    final output = Path.endsAt(path, another);
    expect(output, equals(true));
  });
  test('interface->path->endsAt->root', () {
    final path = [0, 1, 2];
    final another = <int>[];
    final output = Path.endsAt(path, another);
    expect(output, equals(false));
  });
}