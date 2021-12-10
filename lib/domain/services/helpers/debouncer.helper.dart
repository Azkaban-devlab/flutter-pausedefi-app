import 'dart:async';

///
/// [Debouncer]
///
class Debouncer {
  ///
  /// milliseconds
  ///
  final int milliseconds;

  ///
  /// action
  ///
  Function? action;
  Timer? _timer;

  ///
  /// Constructor
  ///
  Debouncer({this.milliseconds = 500});

  ///
  /// Run the debounced action
  ///
  void run(Function action, {Duration? duration}) {
    if (_timer != null) {
      _timer!.cancel();
    }
    _timer = Timer(duration ?? Duration(milliseconds: milliseconds),
        action as void Function());
  }
}
