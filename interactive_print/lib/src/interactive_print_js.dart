import 'dart:js' as js;
import 'dart:convert' show LineSplitter;

final _consoleLines = <List<String>>[];
var _hasNL = true; // Whether the last line in _buffer is complete.
final _console = js.context['console'];

void write(String string, {bool newline = false}) {
  if (string.isNotEmpty) {
    for (var part in LineSplitter.split(string)) {
      if (_hasNL) {
        _consoleLines.add([part]);
      } else {
        _consoleLines.last[0] += part;
        _hasNL = true;
      }
    }
    _hasNL = newline || string.endsWith('\n') || string.endsWith('\r');
    _console.callMethod('clear');
    for (var line in _consoleLines) {
      _console.callMethod('log', line);
    }
  } else if (newline) {
    if (_hasNL) {
      _consoleLines.add(['']);
    } else {
      _hasNL = true;
    }
  }
}
