import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

enum LoadMoreType { isLoading, idle }

class CustomListWidget extends StatefulWidget {
  final int itemCount;
  final Widget Function(BuildContext context, int index) itemBuilder;
  final Future<void> Function()? onLoadMore;
  final bool enableLoadMore;
  final Axis? scrollDirection;
  final ScrollPhysics? physics;
  final Widget? listHeaderWidget;
  final Decoration? decoration;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? paddingEmpty;
  final EdgeInsetsGeometry? margin;
  final Widget? emptyWidget;
  final Widget? listBottomWidget;
  final bool shrinkWrap;
  final bool reverse;
  final bool visibility;
  final void Function(ScrollController)? scrollListener;
  final ScrollController? scrollController;
  final double distanceLoading;
  final bool showLoadMoreIcon;
  final bool triggerLoadMore;

  const CustomListWidget({
    super.key,
    required this.itemCount,
    required this.itemBuilder,
    this.onLoadMore,
    this.enableLoadMore = false,
    this.scrollDirection = Axis.vertical,
    this.physics =
        const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
    this.listHeaderWidget,
    this.decoration,
    this.padding,
    this.paddingEmpty,
    this.margin,
    this.shrinkWrap = true,
    this.reverse = false,
    this.visibility = true,
    this.scrollListener,
    this.listBottomWidget,
    this.scrollController,
    this.emptyWidget,
    this.distanceLoading = 500,
    this.showLoadMoreIcon = true,
    this.triggerLoadMore = false,
  });

  @override
  State<CustomListWidget> createState() => _CustomListWidgetState();
}

class _CustomListWidgetState extends State<CustomListWidget> {
  late ScrollController controller;
  final GlobalKey _keyHeader = GlobalKey();
  double headerHeight = 0.0;
  LoadMoreType loadMoreType = LoadMoreType.idle;

  @override
  void initState() {
    super.initState();
    controller = widget.scrollController ?? ScrollController();
    controller.addListener(scrollListener);
    if (widget.scrollListener != null) {
      controller.addListener(() => widget.scrollListener!(controller));
    }
    if (widget.triggerLoadMore && widget.enableLoadMore) {
      WidgetsBinding.instance.addPostFrameCallback((_) => onLoadMore());
    }
    WidgetsBinding.instance
        .addPostFrameCallback((_) => _calculateHeaderHeight());
  }

  @override
  void dispose() {
    controller.removeListener(scrollListener);
    if (widget.scrollController == null) controller.dispose();
    super.dispose();
  }

  void _calculateHeaderHeight() {
    final size = _keyHeader.currentContext?.size;
    if (size != null && headerHeight != size.height) {
      setState(() {
        headerHeight = size.height;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: widget.visibility,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final maxHeight = constraints.maxHeight;
          return widget.itemCount > 0
              ? ListView.builder(
                  controller: controller,
                  physics: widget.physics,
                  scrollDirection: widget.scrollDirection ?? Axis.vertical,
                  shrinkWrap: widget.shrinkWrap,
                  reverse: widget.reverse,
                  padding: widget.padding,
                  cacheExtent: 1500.0, 
                  itemCount: widget.itemCount +
                      (widget.listHeaderWidget != null ? 1 : 0) +
                      (widget.enableLoadMore ? 1 : 0),
                  itemBuilder: (context, index) {
                    if (widget.listHeaderWidget != null && index == 0) {
                      return Container(
                        key: _keyHeader,
                        decoration: widget.decoration,
                        margin: widget.margin,
                        child: widget.listHeaderWidget,
                      );
                    }
                    final adjustedIndex =
                        widget.listHeaderWidget != null ? index - 1 : index;
                    if (adjustedIndex < widget.itemCount) {
                      return Container(
                        decoration: widget.decoration,
                        margin: widget.margin,
                        child: widget.itemBuilder(context, adjustedIndex),
                      );
                    }
                    return widget.listBottomWidget ?? _buildFooter();
                  },
                )
              : _buildEmptyWidget(maxHeight);
        },
      ),
    );
  }

  Widget _buildEmptyWidget(double maxHeight) {
    final t = DeviceUtilsCore.languageOf(context);
    return Container(
      constraints: BoxConstraints(
        minHeight: maxHeight - headerHeight,
        maxHeight: maxHeight - headerHeight,
      ),
      padding:
          widget.paddingEmpty ?? const EdgeInsets.symmetric(horizontal: 24),
      child: Center(
        child: widget.emptyWidget ??
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.error),
                const SizedBox(height: 16),
                Text(t?.noData ?? "", style: AppTextStyleCore.s16w600),
              ],
            ),
      ),
    );
  }

  Widget _buildFooter() {
    return widget.enableLoadMore &&
            widget.showLoadMoreIcon &&
            loadMoreType == LoadMoreType.isLoading
        ? const Padding(
            padding: EdgeInsets.all(16),
            child: Center(child: CircularProgressIndicator()),
          )
        : const SizedBox.shrink();
  }

  void scrollListener() {
    if (controller.position.userScrollDirection == ScrollDirection.reverse &&
        controller.position.extentAfter < widget.distanceLoading &&
        widget.enableLoadMore &&
        loadMoreType == LoadMoreType.idle) {
      onLoadMore();
    }
  }

  Future<void> onLoadMore() async {
    if (loadMoreType == LoadMoreType.isLoading || widget.onLoadMore == null)
      return;
    setState(() => loadMoreType = LoadMoreType.isLoading);
    await widget.onLoadMore!();
    if (mounted) setState(() => loadMoreType = LoadMoreType.idle);
  }
}
