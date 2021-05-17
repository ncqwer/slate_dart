import 'package:slate_dart/slate_dart.dart';
import 'package:slate_dart/src/utils.dart';

class Text implements Descendant {
  final String text;
  @override
  String? key;

  @override
  Map<String, dynamic> data;

  Text({this.text = '', this.key, this.data = const {}});

  Text.from(Text node, {dynamic data, dynamic text})
      : data = getValue(node.data, data),
        text = getValue(node.text, text);

  @override
  bool operator ==(dynamic another) {
    // assert(debugAssertIsValid());
    if (identical(this, another)) return true;
    if (another.runtimeType != runtimeType) return false;
    if (key != null && another.key != null && key == another.key) return true;
    return false;
  }

  static bool matches(Text textNode, Map<String, dynamic> props) {
    final data = textNode.data;

    for (final e in props.entries) {
      if (data[e.key] != e.value) return false;
    }
    return true;
  }

  static List<Text> decorations(Text node, List<Range> decorations) {
    var leaves = <Text>[Text.from(node)];

    for (final dec in decorations) {
      final rangeEntry = Range.edges(dec);
      final begin = rangeEntry.begin;
      final end = rangeEntry.end;
      final next = <Text>[];
      var o = 0;

      for (final leaf in leaves) {
        final length = leaf.text.length;
        final offset = o;
        o += length;

        if (begin.offset <= offset && end.offset >= offset + length) {
          if (dec.data != null) leaf.data.addEntries(dec.data!.entries);
          next.add(leaf);
          continue;
        }
        if (begin.offset > offset + length ||
            end.offset < offset ||
            (end.offset == offset) && offset != 0) {
          next.add(leaf);
          continue;
        }

        var middle = leaf;
        Text? before;
        Text? after;

        if (end.offset < offset + length) {
          final off = end.offset - offset;
          after = Text(text: middle.text.substring(off), data: middle.data);
          middle = Text(text: middle.text.substring(0, off), data: middle.data);
        }

        if (begin.offset > offset) {
          final off = begin.offset - offset;
          before = Text(text: middle.text.substring(0, off), data: middle.data);
          middle = Text(text: middle.text.substring(off), data: middle.data);
        }

        if (dec.data != null) {
          middle = Text.from(middle,
              data: (Map<String, dynamic> _d) => (<String, dynamic>{})
                ..addEntries(_d.entries)
                ..addEntries(dec.data!.entries));
        }
        if (before != null) next.add(before);
        next.add(middle);
        if (after != null) next.add(after);
      }
      leaves = next;
    }
    return leaves;
  }
}

// void main(List<String> args) {
//   final m = {
//     '1': 1,
//     '2': 'hhh',
//   };

//   final a = {}..addEntries(m.entries);
//   a['1'] = 2;
//   print('$m $a');
// }
