import 'package:test/test.dart';
import 'package:slate_dart/slate_dart.dart';

void main() {
  test('interface->path->common->root', () {
    final path = [0, 1, 2];
    final another = [0, 2];
    final output = Path.common(path, another);
    expect(output, equals([0]));
  });
}
