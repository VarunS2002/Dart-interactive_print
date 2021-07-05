import 'dart:async';

import 'interactive_print_stub.dart'
    if (dart.library.io) 'interactive_print_native.dart'
    if (dart.library.js) 'interactive_print_js.dart' as ip;

/// Captures calls to [print] in the [body] and forwards them to [writeln].
void capturePrint(void Function() body) {
  runZoned(body, zoneSpecification: ZoneSpecification(print: (s, p, z, arg) {
    writeln(arg);
  }));
}

/// Writes [string] to the console without adding a newline.
///
/// Line may not be printed until a newline is added.
/// Always add an empty \\n or [writeln] call after all [write] calls.
/// May not work properly in debug builds, for use in release mode.
void write(String string) {
  ip.write(string);
}

/// Writes [string] to the console and adds a newline if the string doesn't end
/// in one.
void writeln([String string = '']) {
  ip.write(string, newline: true);
}
