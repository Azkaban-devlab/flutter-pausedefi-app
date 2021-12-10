import 'package:flutter/material.dart';

///
/// [ViewModel]
///
abstract class ViewModel extends ChangeNotifier {
  bool _isDisposed = false;

  ///
  /// Execute [callback] and notify after
  ///
  void notifyAfter(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  @override
  void notifyListeners() {
    if (_isDisposed) return;
    super.notifyListeners();
  }

  @override
  void dispose() {
    _isDisposed = true;
    super.dispose();
  }
}
