
import 'package:flutter/cupertino.dart';

class UIDataProvider2ViewModel extends ChangeNotifier {
  int count = 0;

  currentCountMinus() {
    count = count - 1;
    notifyListeners();
  }

}