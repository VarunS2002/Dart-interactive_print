# Dart-interactive_print

A Dart library to simulate print() without adding a trailing newline for both Native and Web.

> [![Latest_Release](https://img.shields.io/pub/v/interactive_print)](https://pub.dev/packages/interactive_print)
[![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)

## [Changelog](https://github.com/VarunS2002/Dart-interactive_print/blob/main/interactive_print/CHANGELOG.md)

## Usage

```yaml
dependencies:
  interactive_print: ^1.0.0
```

A simple usage example:

```dart
import 'package:interactive_print/interactive_print.dart';

void main() {
  write('Hello');
  writeln('There');
  write('General Kenobi');
  writeln('.');
}
```

## Objective of this package

The `print()` function in Dart always adds a newline to the end, so you cannot print character by character. This is
particularly useful if you want to have a delay between printing characters or if you want to construct a line
dynamically using characters at runtime. Dart has 2 supported platforms namely Native and Web. On Native, you can
use `stdout.write()` to print without a newline, however this breaks support for Web as this function is not supported.
Web also doesn't have any method to print without a newline but this behaviour can be simulated
like [this](https://stackoverflow.com/a/41817778/13978447). This Dart library provides its own `write()` and `writeln()`
function which will dynamically use `stdout.write()` or the `console.log()` trick based on the platform you are running
on. More discussion [here](https://github.com/dart-lang/sdk/issues/46383).

## Note

- May not work correctly if you run your application in debug mode.

- If you face any issue or have suggestions then feel free to open an issue on GitHub.

- Majority of the code was contributed by [lrhn](https://github.com/lrhn). 
