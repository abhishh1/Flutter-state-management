import 'package:flutter/cupertino.dart';
import 'package:random_string/random_string.dart';

class RandomGenerator extends ChangeNotifier {
  var _randomString;
  String get getString {
    return _randomString;
  }

  void generateString() {
    _randomString = randomString(320);
    notifyListeners();
  }

  void generateInteger(){
    _randomString = randomNumeric(10);
    notifyListeners();
  }
}
