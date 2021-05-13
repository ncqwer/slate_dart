import 'package:test/test.dart';
import 'package:slate_dart/slate_dart.dart';

void main() {
  test('interface->path->common->root7777', () {
    final path = [0, 1, 2];
    final another = [3, 2];
    final output = Path.common(path, another);
    expect(output, equals([]));
  });
}
