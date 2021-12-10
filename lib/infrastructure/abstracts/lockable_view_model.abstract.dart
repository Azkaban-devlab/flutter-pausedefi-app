import 'dart:async';

import 'package:app/domain/services/ui/dialog.service.dart';
import 'package:flutter/material.dart';

import 'view_model.abstract.dart';

///
/// [LockableViewModel]
///
abstract class LockableViewModel extends ViewModel {
  bool _locked = false;
  Locker? _currentLocker;

  ///
  /// Check if the ViewModel is locked
  ///
  bool get locked => _locked;

  ///
  /// Lock state
  ///
  void lock(Locker locker, [bool notify = true]) {
    if (_locked) return;

    _locked = true;
    _currentLocker = locker;

    if (notify) {
      notifyListeners();
    }
  }

  ///
  /// Unlock state
  ///
  /// Will unlock only if the locker is the same used to lock
  ///
  void unlock(Locker locker, [bool notify = true]) {
    if (locker != _currentLocker) return;

    _locked = false;
    _currentLocker = null;

    if (notify) {
      notifyListeners();
    }
  }

  ///
  /// Lock state and show loading dialog
  ///
  StreamController<String>? lockWithLoad(BuildContext context, Locker locker,
      [bool notify = true]) {
    lock(locker, notify);

    return DialogService.showLoadingDialog(context);
  }

  ///
  /// Unlock state and close loading dialog
  ///
  /// Will unlock only if the locker is the same used to lock
  ///
  void unlockWithLoad(BuildContext context, Locker locker,
      [bool notify = true]) {
    if (locker != _currentLocker) return;
    unlock(locker, notify);

    DialogService.closeLoadingDialog(context);
  }
}

/// Locker
///
/// To be used to lock the viewmodel
class Locker {
  /// Identifier
  final int identifier;

  /// Factory
  factory Locker([Type? caller]) {
    return Locker._(
        ((caller?.hashCode ?? 0) + DateTime.now().microsecondsSinceEpoch));
  }

  Locker._(this.identifier);

  @override
  bool operator ==(Object other) {
    return other is Locker && other.identifier == identifier;
  }

  @override
  int get hashCode => identifier;
}
