import 'package:app/infrastructure/abstracts/lockable_view_model.abstract.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

///
/// [HomeMainViewModel]
///
class HomeMainViewModel extends LockableViewModel {
  ///
  /// Constructor
  ///
  HomeMainViewModel();

  ///
  /// Build this ViewModel
  ///
  static ChangeNotifierProvider<HomeMainViewModel> buildWithProvider(
      {required Widget Function(BuildContext context, Widget? child)? builder,
      Widget? child}) {
    return ChangeNotifierProvider<HomeMainViewModel>(
      create: (BuildContext context) => HomeMainViewModel(),
      builder: builder,
      lazy: false,
      child: child,
    );
  }

  ///
  /// Provide a built ViewModel
  ///
  static HomeMainViewModel provide(BuildContext context, {bool listen = true}) {
    return Provider.of<HomeMainViewModel>(context, listen: listen);
  }
}
