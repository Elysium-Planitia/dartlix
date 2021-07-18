import 'dart:convert';
import 'dart:io';
import 'package:dartlix/ansiTools.dart';
import 'package:dartlix/dartlix.dart' as dartlix;

void main(List<String> arguments) async {
  var ansiTools = AnsiTools();
  ansiTools.outColored('***** Dartlix *****', 220, true);
  stdout.writeln();
  ansiTools.outColored('Enter file path: ', 220, false);
  var filePath = stdin.readLineSync();
  if (filePath != null) {
    var isFile = File(filePath).existsSync();
    //TODO: check if it is text file (check by mime type not just txt)
    if(isFile) {
      var text = '';
      var textStream = await File(filePath).openRead().transform(utf8.decoder).toList();
      textStream.fold('', (previousValue, element) {
        if (previousValue != null) {
          text = previousValue.toString() + element;
        }
      });
      print(text);
      var words = text.split(' ');
      print(words.length);
    }
  }
}
