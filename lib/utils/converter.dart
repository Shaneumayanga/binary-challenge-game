import 'dart:convert';
import 'dart:math';

class BinConverter {
  final String bin;
  BinConverter({this.bin});
  int converterTodecimal() {
    var binarr = bin.split("");
    int dec = 0;
    var i = binarr.length;
    var len = binarr.length;
    while (i > 0) {
      int j = i - 1;
      int bit = int.parse(binarr[j]);
      int poww = pow(2, (len - i));
      int power = poww * bit;
      print("$poww * $bit = $power");
      dec = dec + power;
      i--;
    }
    print("answers in convert.dart $dec");
    return dec;
  }

  convertTohex() {
    var binarr = bin.split("");
    int dec = 0;
    var i = binarr.length;
    var len = binarr.length;
    while (i > 0) {
      int j = i - 1;
      int bit = int.parse(binarr[j]);
      int poww = pow(2, (len - i));
      int power = poww * bit;
      print("$poww * $bit = $power");
      dec = dec + power;
      i--;
    }
    return dec.toRadixString(16);
  }

  convertToOct() {
    var binarr = bin.split("");
    int dec = 0;
    var i = binarr.length;
    var len = binarr.length;
    while (i > 0) {
      int j = i - 1;
      int bit = int.parse(binarr[j]);
      int poww = pow(2, (len - i));
      int power = poww * bit;
      print("$poww * $bit = $power");
      dec = dec + power;
      i--;
    }
    return dec.toRadixString(8);
  }
}
