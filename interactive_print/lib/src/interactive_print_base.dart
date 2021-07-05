import 'dart:async';

import 'interactive_print_stub.dart'
    if (dart.library.io) 'interactive_print_native.dart'
    if (dart.library.js) 'interactive_print_js.dart' as ip;

void capturePrint(void Function() body) {
  runZoned(body, zoneSpecification: ZoneSpecification(print: (s, p, z, arg) {
    writeln(arg);
  }));
}

void write(String string) {
  ip.write(string);
}

void writeln([String string = '']) {
  ip.write(string, newline: true);
}
