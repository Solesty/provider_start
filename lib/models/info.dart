import 'package:flutter/foundation.dart';

class Info with ChangeNotifier {
  String _title;
  String _description;

  Info() {
    _title = "Default title";
    _description = "This is the default Description";
  }

  String get title => _title;
  String get description => _description;

  changeTitle(String value) {
    _title = value;
    notifyListeners();
  }

  changeDescription(String value) {
    _description = value;
    notifyListeners();
  }
}
