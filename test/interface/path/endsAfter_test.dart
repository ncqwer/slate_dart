import 'package:test/test.dart';
import 'package:slate_dart/slate_dart.dart';

void main() {
  test('interface->path->endsAfter->above', () {
    final path = [0, 1, 2];
    final another = [0];
    final output = Path.endsAfter(path, another);
    expect(output, equals(false));
  });
}
