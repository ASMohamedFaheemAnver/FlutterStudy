import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PullToRefreshWidget extends StatefulWidget {
  final Widget child;
  final Future Function() onRefresh;
  PullToRefreshWidget({required this.child, required this.onRefresh});
  @override
  State<StatefulWidget> createState() {
    return _PullToRefreshWidget();
  }
}

class _PullToRefreshWidget extends State<PullToRefreshWidget> {
  @override
  Widget build(BuildContext context) {
    return !Platform.isAndroid
        ? RefreshIndicator(child: widget.child, onRefresh: widget.onRefresh)
        : CustomScrollView(
            physics: BouncingScrollPhysics(),
            slivers: [
              CupertinoSliverRefreshControl(onRefresh: widget.onRefresh),
              SliverToBoxAdapter(child: widget.child),
            ],
          );
  }
}
