import 'package:app/infrastructure/abstracts/lockable_view_model.abstract.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

///
/// [MainViewModel]
///
class MainViewModel extends LockableViewModel {
  ///
  /// Constructor
  ///
  MainViewModel();

  ///
  /// Build this ViewModel
  ///
  static ChangeNotifierProvider<MainViewModel> buildWithProvider(
      {required Widget Function(BuildContext context, Widget? child)? builder,
      Widget? child}) {
    return ChangeNotifierProvider<MainViewModel>(
      create: (BuildContext context) => MainViewModel(),
      builder: builder,
      lazy: false,
      child: child,
    );
  }

  ///
  /// Provide a built ViewModel
  ///
  static MainViewModel provide(BuildContext context, {bool listen = true}) {
    return Provider.of<MainViewModel>(context, listen: listen);
  }
}
