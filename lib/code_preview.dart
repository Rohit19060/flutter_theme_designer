import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:string_scanner/string_scanner.dart';

class CodePreview extends StatelessWidget {
  const CodePreview({super.key, required this.str});
  final String str;

  @override
  Widget build(BuildContext context) => Container(
        constraints: const BoxConstraints.expand(),
        decoration: BoxDecoration(border: Border(left: BorderSide(color: Colors.blueGrey.shade800)), color: Colors.blueGrey.shade900),
        padding: const EdgeInsets.only(top: 24, left: 24),
        child: Stack(
          children: [
            SingleChildScrollView(
              child: RichText(
                text: DartSyntaxHighlighter().format(str),
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: IconButton(
                  icon: const Icon(
                    Icons.copy,
                    color: Colors.white,
                  ),
                  onPressed: () async => Clipboard.setData(ClipboardData(text: str)),
                ),
              ),
            ),
          ],
        ),
      );
}

class SyntaxHighlighterStyle {
  const SyntaxHighlighterStyle({
    required this.baseStyle,
    required this.numberStyle,
    required this.commentStyle,
    required this.keywordStyle,
    required this.stringStyle,
    required this.punctuationStyle,
    required this.classStyle,
    required this.constantStyle,
  });

  const SyntaxHighlighterStyle.panacheThemeStyle({
    this.baseStyle = const TextStyle(color: Color(0xFF90DBD4)),
    this.numberStyle = const TextStyle(color: Color(0xFF90DBD4), fontFamily: 'Roboto'),
    this.commentStyle = const TextStyle(color: Color(0xFF9E9E9E), fontFamily: 'Roboto'),
    this.keywordStyle = const TextStyle(color: Color(0xFFF06292), fontFamily: 'Roboto'),
    this.stringStyle = const TextStyle(color: Color(0xFFD4E157), fontFamily: 'Roboto'),
    this.punctuationStyle = const TextStyle(color: Color(0xFFFDD835), fontFamily: 'Roboto'),
    this.classStyle = const TextStyle(color: Color(0xFFFDD835), fontFamily: 'Roboto'),
    this.constantStyle = const TextStyle(color: Color(0xFF795548), fontFamily: 'Roboto'),
  });

  const SyntaxHighlighterStyle.lightThemeStyle({
    this.baseStyle = const TextStyle(color: Color(0xFF000000)),
    this.numberStyle = const TextStyle(color: Color(0xFF1565C0)),
    this.commentStyle = const TextStyle(color: Color(0xFF9E9E9E)),
    this.keywordStyle = const TextStyle(color: Color(0xFF9C27B0)),
    this.stringStyle = const TextStyle(color: Color(0xFF43A047)),
    this.punctuationStyle = const TextStyle(color: Color(0xFF000000)),
    this.classStyle = const TextStyle(color: Color(0xFF512DA8)),
    this.constantStyle = const TextStyle(color: Color(0xFF795548)),
  });

  const SyntaxHighlighterStyle.darkThemeStyle({
    this.baseStyle = const TextStyle(color: Color(0xFFFFFFFF)),
    this.numberStyle = const TextStyle(color: Color(0xFF1565C0)),
    this.commentStyle = const TextStyle(color: Color(0xFF9E9E9E)),
    this.keywordStyle = const TextStyle(color: Color(0xFF80CBC4)),
    this.stringStyle = const TextStyle(color: Color(0xFF009688)),
    this.punctuationStyle = const TextStyle(color: Color(0xFFFFFFFF)),
    this.classStyle = const TextStyle(color: Color(0xFF009688)),
    this.constantStyle = const TextStyle(color: Color(0xFF795548)),
  });

  final TextStyle baseStyle;
  final TextStyle numberStyle;
  final TextStyle commentStyle;
  final TextStyle keywordStyle;
  final TextStyle stringStyle;
  final TextStyle punctuationStyle;
  final TextStyle classStyle;
  final TextStyle constantStyle;
}

class DartSyntaxHighlighter {
  final _style = const SyntaxHighlighterStyle.darkThemeStyle();

  static const List<String> _keywords = <String>[
    'abstract',
    'as',
    'assert',
    'async',
    'await',
    'break',
    'case',
    'catch',
    'class',
    'const',
    'continue',
    'default',
    'deferred',
    'do',
    'dynamic',
    'else',
    'enum',
    'export',
    'external',
    'extends',
    'factory',
    'false',
    'final',
    'finally',
    'for',
    'get',
    'if',
    'implements',
    'import',
    'in',
    'is',
    'library',
    'new',
    'null',
    'operator',
    'part',
    'rethrow',
    'return',
    'set',
    'static',
    'super',
    'switch',
    'sync',
    'this',
    'throw',
    'true',
    'try',
    'typedef',
    'var',
    'void',
    'while',
    'with',
    'yield'
  ];

  static const List<String> _builtInTypes = <String>['int', 'double', 'num', 'bool'];

  String _src = '';
  StringScanner _scanner = StringScanner('');

  final List<_HighlightSpan> _spans = <_HighlightSpan>[];

  TextSpan format(String src) {
    _src = src;
    _scanner = StringScanner(_src);

    if (_generateSpans()) {
      final formattedText = <TextSpan>[];
      var currentPosition = 0;
      for (final span in _spans) {
        if (currentPosition != span.start) {
          formattedText.add(TextSpan(text: _src.substring(currentPosition, span.start)));
        }
        formattedText.add(TextSpan(style: span.textStyle(_style), text: span.textForSpan(_src)));
        currentPosition = span.end;
      }
      if (currentPosition != _src.length) {
        formattedText.add(TextSpan(text: _src.substring(currentPosition, _src.length)));
      }
      return TextSpan(style: _style.baseStyle, children: formattedText);
    } else {
      return TextSpan(style: _style.baseStyle, text: src);
    }
  }

  bool _generateSpans() {
    var lastLoopPosition = _scanner.position;
    while (!_scanner.isDone) {
      // Skip White space
      _scanner.scan(RegExp(r'\s+'));

      // Block comments
      if (_scanner.scan(RegExp(r'/\*(.|\n)*\*/'))) {
        _spans.add(_HighlightSpan(_HighlightType.comment, _scanner.lastMatch?.start ?? 0, _scanner.lastMatch?.end ?? 0));
        continue;
      }

      // Line comments
      if (_scanner.scan('//')) {
        final startComment = _scanner.lastMatch?.start ?? 0;

        var eof = false;
        int endComment;
        if (_scanner.scan(RegExp(r'.*\n'))) {
          endComment = (_scanner.lastMatch?.end ?? 0) - 1;
        } else {
          eof = true;
          endComment = _src.length;
        }

        _spans.add(_HighlightSpan(_HighlightType.comment, startComment, endComment));

        if (eof) {
          break;
        }

        continue;
      }

      // Raw r"String"
      if (_scanner.scan(RegExp(r'r".*"'))) {
        _spans.add(_HighlightSpan(_HighlightType.string, _scanner.lastMatch?.start ?? 0, _scanner.lastMatch?.end ?? 0));
        continue;
      }

      // Raw r'String'
      if (_scanner.scan(RegExp(r"r'.*'"))) {
        _spans.add(_HighlightSpan(_HighlightType.string, _scanner.lastMatch?.start ?? 0, _scanner.lastMatch?.end ?? 0));
        continue;
      }

      // Multiline """String"""
      if (_scanner.scan(RegExp(r'"""(?:[^"\\]|\\(.|\n))*"""'))) {
        _spans.add(_HighlightSpan(_HighlightType.string, _scanner.lastMatch?.start ?? 0, _scanner.lastMatch?.end ?? 0));
        continue;
      }

      // Multiline '''String'''
      if (_scanner.scan(RegExp(r"'''(?:[^'\\]|\\(.|\n))*'''"))) {
        _spans.add(_HighlightSpan(_HighlightType.string, _scanner.lastMatch?.start ?? 0, _scanner.lastMatch?.end ?? 0));
        continue;
      }

      // "String"
      if (_scanner.scan(RegExp(r'"(?:[^"\\]|\\.)*"'))) {
        _spans.add(_HighlightSpan(_HighlightType.string, _scanner.lastMatch?.start ?? 0, _scanner.lastMatch?.end ?? 0));
        continue;
      }

      // 'String'
      if (_scanner.scan(RegExp(r"'(?:[^'\\]|\\.)*'"))) {
        _spans.add(_HighlightSpan(_HighlightType.string, _scanner.lastMatch?.start ?? 0, _scanner.lastMatch?.end ?? 0));
        continue;
      }

      // Double
      if (_scanner.scan(RegExp(r'\d+\.\d+'))) {
        _spans.add(_HighlightSpan(_HighlightType.number, _scanner.lastMatch?.start ?? 0, _scanner.lastMatch?.end ?? 0));
        continue;
      }

      // Integer
      if (_scanner.scan(RegExp(r'\d+'))) {
        _spans.add(_HighlightSpan(_HighlightType.number, _scanner.lastMatch?.start ?? 0, _scanner.lastMatch?.end ?? 0));
        continue;
      }

      // Punctuation
      if (_scanner.scan(RegExp(r'[\[\]{}().!=<>&\|\?\+\-\*/%\^~;:,]'))) {
        _spans.add(_HighlightSpan(_HighlightType.punctuation, _scanner.lastMatch?.start ?? 0, _scanner.lastMatch?.end ?? 0));
        continue;
      }

      // Meta data
      if (_scanner.scan(RegExp(r'@\w+'))) {
        _spans.add(_HighlightSpan(_HighlightType.keyword, _scanner.lastMatch?.start ?? 0, _scanner.lastMatch?.end ?? 0));
        continue;
      }

      // Words
      if (_scanner.scan(RegExp(r'\w+'))) {
        var type = _HighlightType.comment;

        var word = _scanner.lastMatch?.group(0) ?? '';
        if (word.startsWith('_')) {
          word = word.substring(1);
        }

        if (_keywords.contains(word)) {
          {
            type = _HighlightType.keyword;
          }
        } else if (_builtInTypes.contains(word)) {
          type = _HighlightType.keyword;
        } else if (_firstLetterIsUpperCase(word)) {
          type = _HighlightType.klass;
        } else if (word.length >= 2 && word.startsWith('k') && _firstLetterIsUpperCase(word.substring(1))) {
          type = _HighlightType.constant;
        }

        _spans.add(_HighlightSpan(type, _scanner.lastMatch?.start ?? 0, _scanner.lastMatch?.end ?? 0));
      }

      // Check if this loop did anything
      if (lastLoopPosition == _scanner.position) {
        // Failed to parse this file, abort gracefully
        return false;
      }
      lastLoopPosition = _scanner.position;
    }

    _simplify();
    return true;
  }

  void _simplify() {
    for (var i = _spans.length - 2; i >= 0; i -= 1) {
      if (_spans[i].type == _spans[i + 1].type && _spans[i].end == _spans[i + 1].start) {
        _spans[i] = _HighlightSpan(_spans[i].type, _spans[i].start, _spans[i + 1].end);
        _spans.removeAt(i + 1);
      }
    }
  }

  bool _firstLetterIsUpperCase(String str) {
    if (str.isNotEmpty) {
      final first = str.substring(0, 1);
      return first == first.toUpperCase();
    }
    return false;
  }
}

enum _HighlightType { number, comment, keyword, string, punctuation, klass, constant }

class _HighlightSpan {
  _HighlightSpan(this.type, this.start, this.end);
  final _HighlightType type;
  final int start;
  final int end;

  String textForSpan(String src) => src.substring(start, end);

  TextStyle textStyle(SyntaxHighlighterStyle style) {
    switch (type) {
      case _HighlightType.number:
        return style.numberStyle;
      case _HighlightType.comment:
        return style.commentStyle;
      case _HighlightType.keyword:
        return style.keywordStyle;
      case _HighlightType.string:
        return style.stringStyle;
      case _HighlightType.punctuation:
        return style.punctuationStyle;
      case _HighlightType.klass:
        return style.classStyle;
      case _HighlightType.constant:
        return style.constantStyle;
    }
  }
}
