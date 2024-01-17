
import 'package:flutter/cupertino.dart';

class UIDataProviderViewModel extends ChangeNotifier {
  int count = 0;

  currentCountAdd() {
    count = count + 1;
    notifyListeners();
  }

}