import 'dart:io';

void write(String string, {bool newline = false}) {
  if (newline && !(string.endsWith('\n') || string.endsWith('\r'))) {
    stdout.writeln(string);
  } else {
    stdout.write(string);
  }
}
