import 'package:test/test.dart';
import 'package:slate_dart/slate_dart.dart';

void main() {
  test('interface->path->ancestors->reverse', () {
    final input = [0, 1, 2];
    final output = Path.ancestors(input, reverse: true);
    expect(
        output,
        equals(<List<int>>[
          [0, 1],
          [0],
          []
        ]));
  });
}
