import 'dart:io';

class AnsiTools {
  final String _startAnsiColor = '\u001b[38;5;';
  final String _stopAnsiColor = '\u001b[0m';

  bool outColored(String text, int color, bool lineBreak) {
    if (color >= 0 && color < 256) {
      if (lineBreak) {
        stdout.writeln(_startAnsiColor + color.toString() + 'm' + text + _stopAnsiColor);
      } else {
        stdout.write(_startAnsiColor + color.toString() + 'm' + text + _stopAnsiColor);
      }
      return true;
    }
    return false;
  }

}
