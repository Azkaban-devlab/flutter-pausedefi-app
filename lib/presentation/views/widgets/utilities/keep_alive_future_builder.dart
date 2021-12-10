import 'package:flutter/material.dart';

///
/// [KeepAliveFutureBuilder]
/// Avoid to reload/rexecute the future
///
class KeepAliveFutureBuilder extends StatefulWidget {
  ///
  /// Constructor
  ///
  const KeepAliveFutureBuilder(
      {Key? key,
      this.future,
      required this.child,
      this.initialData,
      this.loader})
      : super(key: key);

  /// future
  final Future<dynamic>? future;

  /// child
  final Widget child;

  /// loader
  final Widget? loader;

  /// initial data
  final dynamic initialData;

  @override
  _KeepAliveFutureBuilderState createState() => _KeepAliveFutureBuilderState();
}

class _KeepAliveFutureBuilderState extends State<KeepAliveFutureBuilder>
    with AutomaticKeepAliveClientMixin {
  ConnectionState? _connectionState;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    if (_connectionState != null) {
      return widget.child;
    } else {
      return FutureBuilder<dynamic>(
        initialData: widget.initialData,
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          _connectionState = snapshot.connectionState;
          if (_connectionState != ConnectionState.done &&
              widget.loader != null) {
            return widget.loader!;
          }
          return snapshot.connectionState == ConnectionState.done
              ? widget.child
              : const SizedBox();
        },
        future: widget.future,
      );
    }
  }

  @override
  bool get wantKeepAlive => true;
}
