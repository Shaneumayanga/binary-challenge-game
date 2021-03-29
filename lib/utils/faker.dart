import 'dart:convert';
import 'dart:math';

import 'package:binaryc/utils/converter.dart';
import 'package:binaryc/utils/randomBinmaker.dart';

class Faker {
  final String type;
  final String binary;
  Faker({this.type, this.binary});

  genfake() {
    var fake;
    switch (type) {
      case "Decimal":
        fake =
            BinConverter(bin: BinService(length: binary.length).makeBinString())
                .converterTodecimal();
        break;
      case "Hex":
        fake =
            BinConverter(bin: BinService(length: binary.length).makeBinString())
                .convertTohex();
        break;
      case "Oct":
        fake =
            BinConverter(bin: BinService(length: binary.length).makeBinString())
                .convertToOct();
        break;
    }

    return fake;
  }
}
