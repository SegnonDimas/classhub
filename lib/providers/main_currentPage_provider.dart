import 'package:flutter/material.dart';

class CurrentPageProvider with ChangeNotifier {
  int _currentPage = 0;
  int get currentPage => _currentPage;

  void setCurrentPage(int index) {
    _currentPage = index;
    notifyListeners();
  }
}
