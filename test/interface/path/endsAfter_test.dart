import 'package:test/test.dart';
import 'package:slate_dart/slate_dart.dart';

void main() {
  test('interface->path->endsAfter->above', () {
    final path = [0, 1, 2];
    final another = [0];
    final output = Path.endsAfter(path, another);
    expect(output, equals(false));
  });

  test('interface->path->endsAfter->after', () {
    final path = [1, 1, 2];
    final another = [0];
    final output = Path.endsAfter(path, another);
    expect(output, equals(false));
  });

  test('interface->path->endsAfter->before', () {
    final path = [0, 1, 2];
    final another = [1];
    final output = Path.endsAfter(path, another);
    expect(output, equals(false));
  });

  test('interface->path->endsAfter->below', () {
    final path = [0];
    final another = [0, 1];
    final output = Path.endsAfter(path, another);
    expect(output, equals(false));
  });

  test('interface->path->endsAfter->ends-after', () {
    final path = [1];
    final another = [0, 2];
    final output = Path.endsAfter(path, another);
    expect(output, equals(true));
  });

  test('interface->path->endsAfter->ends-at', () {
    final path = [0];
    final another = [0, 2];
    final output = Path.endsAfter(path, another);
    expect(output, equals(false));
  });

  test('interface->path->endsAfter->ends-before', () {
    final path = [0];
    final another = [1, 2];
    final output = Path.endsAfter(path, another);
    expect(output, equals(false));
  });

  test('interface->path->endsAfter->equal', () {
    final path = [0, 1, 2];
    final another = [0, 1, 2];
    final output = Path.endsAfter(path, another);
    expect(output, equals(false));
  });  

  test('interface->path->endsAfter->root', () {
    final path = [0, 1, 2];
    final another = <int>[];
    final output = Path.endsAfter(path, another);
    expect(output, equals(false));
  });  
}
