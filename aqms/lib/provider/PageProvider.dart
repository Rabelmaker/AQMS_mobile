import 'package:flutter/material.dart';

class PageProvider with ChangeNotifier{
  final PageController _controller = PageController();
  int _currentIndex = 0;
  PageController get controller => _controller;
  int get currentIndex => _currentIndex;

  void setIndex(int index){
    _currentIndex = index;
    notifyListeners();
  }
}