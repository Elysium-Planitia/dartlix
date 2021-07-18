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
      //TODO: not only old method, try flesch
      var words = text.split(' ');
      var longWords = words.where((element) => element.length > 6);
      var sentences = text.split(RegExp(r'\b((?!=|\.|\?|\!).)+(.)\b'));
      stdout.writeln();
      ansiTools.outColored('words: ${words.length}', 220, true);
      ansiTools.outColored('long words: ${longWords.length}', 220, true);
      ansiTools.outColored('sentences: ${sentences.length}', 220, true);
      var sl = words.length / sentences.length;
      var lw = (longWords.length / words.length) * 100;
      var lix = sl + lw;
      ansiTools.outColored('LIX: ${lix.toStringAsFixed(2)}', 220, true);
      if (stdin.readLineSync() == 'exit') {
        exit(0);
      }
      exit(1);
    }
  }
}
