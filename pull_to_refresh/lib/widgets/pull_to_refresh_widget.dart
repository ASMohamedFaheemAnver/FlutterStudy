import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PullToRefreshWidget extends StatefulWidget {
  final Widget child;
  final Future Function() onRefresh;
  final GlobalKey<RefreshIndicatorState>? refreshGlobalKey;

  PullToRefreshWidget(
      {required this.child, required this.onRefresh, this.refreshGlobalKey});
  @override
  State<StatefulWidget> createState() {
    return _PullToRefreshWidget();
  }
}

class _PullToRefreshWidget extends State<PullToRefreshWidget> {
  @override
  Widget build(BuildContext context) {
    return !Platform.isAndroid
        ? RefreshIndicator(
            key: widget.refreshGlobalKey,
            child: widget.child,
            onRefresh: widget.onRefresh)
        : CustomScrollView(
            physics: BouncingScrollPhysics(),
            slivers: [
              CupertinoSliverRefreshControl(onRefresh: widget.onRefresh),
              SliverToBoxAdapter(child: widget.child),
            ],
          );
  }
}
