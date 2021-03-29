import 'dart:convert';
import 'dart:math';

class BinService {
  final int length;
  BinService({this.length});

  makeBinString() {
    String bin = "";
    int random;
    print(length);
    for (var i = 0; i < length; i++) {
      random = Random().nextInt(2);
      String binstring = random.toString();
      bin = bin + binstring;
    }
    return bin;
  }


  
}
