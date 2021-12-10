import 'package:app/presentation/styles/colors.dart';
import 'package:flutter/material.dart';

// ignore_for_file: public_member_api_docs

class InfiniteScrollview extends StatefulWidget {
  const InfiniteScrollview(
      {Key? key,
      required this.children,
      this.primary = true,
      this.shrinkWrap = false,
      this.scrollDirection = Axis.vertical,
      this.topReachedOffset = 0.0,
      this.endReachedOffset = 100.0,
      this.isLoading = false,
      this.onRefresh,
      this.refreshIndicatorKey,
      this.padding,
      this.physics,
      this.onEndReached,
      this.onTopReached,
      this.emptyBuilder,
      this.loadingBuilder,
      this.externalController,
      this.controller})
      : super(key: key);

  final bool primary;
  final bool shrinkWrap;
  final Axis scrollDirection;
  final List<Widget> children;
  final ScrollController? controller;
  final ScrollController? externalController;
  final Future<void> Function()? onRefresh;
  final Future<void> Function()? onEndReached;
  final Future<void> Function()? onTopReached;
  final ScrollPhysics? physics;
  final double endReachedOffset;
  final double topReachedOffset;
  final EdgeInsets? padding;
  final Key? refreshIndicatorKey;
  final WidgetBuilder? emptyBuilder;
  final WidgetBuilder? loadingBuilder;
  final bool isLoading;

  @override
  _InfiniteScrollviewState createState() => _InfiniteScrollviewState();
}

class _InfiniteScrollviewState extends State<InfiniteScrollview> {
  late bool _endReachedTriggered;
  late bool _topReachedTriggered;
  late bool _endReachedCallbackProcessing;
  late bool _topReachedCallbackProcessing;

  @override
  void initState() {
    super.initState();

    _topReachedTriggered = true;
    _endReachedTriggered = true;
    _endReachedCallbackProcessing = false;
    _topReachedCallbackProcessing = false;

    if (widget.externalController != null) {
      widget.externalController!.addListener(_onExternalControllerScrollChange);
    }
  }

  @override
  void dispose() {
    widget.externalController
        ?.removeListener(_onExternalControllerScrollChange);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      key: widget.refreshIndicatorKey,
      notificationPredicate: (ScrollNotification notification) {
        _onScrollChange(notification);
        return defaultScrollNotificationPredicate(notification);
      },
      onRefresh: widget.onRefresh ?? () async {},
      strokeWidth: 1,
      backgroundColor: Colors.white,
      color: AppColors.primaryColor,
      child: widget.children.isEmpty
          ? _buildEmpty()
          : Column(
              children: <Widget>[
                ListView(
                  physics: widget.physics ?? const BouncingScrollPhysics(),
                  primary: widget.primary,
                  padding: widget.padding,
                  shrinkWrap: widget.shrinkWrap,
                  controller: widget.controller,
                  scrollDirection: widget.scrollDirection,
                  children: widget.children,
                ),
                if (widget.isLoading && widget.loadingBuilder != null)
                  widget.loadingBuilder!(context)
                else
                  Container()
              ],
            ),
    );
  }

  Widget _buildEmpty() {
    return !widget.isLoading && widget.emptyBuilder != null
        ? widget.emptyBuilder!(context)
        : (widget.loadingBuilder != null
            ? widget.loadingBuilder!(context)
            : Container());
  }

  Future<void> _onScrollChange(ScrollNotification notification) async {
    if (notification is ScrollUpdateNotification &&
        widget.externalController == null) {
      await _handleScrollChange(
          notification.metrics.extentAfter, notification.metrics.extentBefore);
    }
  }

  Future<void> _onExternalControllerScrollChange() async {
    if (widget.externalController != null) {
      await _handleScrollChange(widget.externalController!.position.extentAfter,
          widget.externalController!.position.extentBefore);
    }
  }

  Future<void> _handleScrollChange(
      double extentAfter, double extentBefore) async {
    if (extentAfter <= widget.endReachedOffset) {
      if (!_endReachedTriggered) {
        if (widget.onEndReached != null) {
          _endReachedCallbackProcessing = true;
          widget.onEndReached!()
              .whenComplete(() => _endReachedCallbackProcessing = false);
        }
        _endReachedTriggered = true;
      }
    } else if (!_endReachedCallbackProcessing) {
      _endReachedTriggered = false;
    }
    if (extentBefore <= widget.topReachedOffset) {
      if (!_topReachedTriggered) {
        if (widget.onTopReached != null) {
          _topReachedCallbackProcessing = true;
          widget.onTopReached!()
              .whenComplete(() => _topReachedCallbackProcessing = false);
        }
        _topReachedTriggered = true;
      }
    } else if (!_topReachedCallbackProcessing) {
      _topReachedTriggered = false;
    }
  }
}
