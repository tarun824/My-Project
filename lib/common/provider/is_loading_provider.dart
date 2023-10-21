import 'package:flutter/material.dart';

class IsLoadingProvider with ChangeNotifier {
  bool _isLoading = true;
  bool get isLoading => _isLoading;

  void tongalIsLoading(bool setTo) {
    ///tongal the state of _isLoading for every call of the function
    print(setTo);
    _isLoading = setTo;
    notifyListeners();
  }

  bool getIsLoading() {
    ///get current state of isLoading
    return isLoading;
  }
}
