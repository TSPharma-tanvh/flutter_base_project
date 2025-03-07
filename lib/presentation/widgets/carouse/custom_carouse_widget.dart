import 'package:flutter/material.dart';

class CustomCarousel extends StatefulWidget {
  final List<Widget> items;
  final double height;
  final Color activeDotColor;
  final Color inactiveDotColor;
  final double dotSize;
  final double dotSpacing;
  final EdgeInsets padding;
  final double itemWidth;
  final double bottomDotPadding;

  const CustomCarousel({
    super.key,
    required this.items,
    this.height = 150.0,
    this.activeDotColor = Colors.blue,
    this.inactiveDotColor = const Color(0xFF9E9E9E),
    this.dotSize = 8.0,
    this.dotSpacing = 4.0,
    this.padding = const EdgeInsets.all(16.0),
    required this.itemWidth,
    this.bottomDotPadding = 12,
  });

  @override
  State<CustomCarousel> createState() => _CustomCarouselState();
}

class _CustomCarouselState extends State<CustomCarousel> {
  late PageController _pageController;
  int _currentIndex = 0;
  bool _isReady = false;
  bool _hasScrolled = false;

  @override
  void initState() {
    super.initState();
    final screenWidth = WidgetsBinding.instance.window.physicalSize.width /
        WidgetsBinding.instance.window.devicePixelRatio;
    final viewportFraction = widget.itemWidth / screenWidth;

    _pageController = PageController(
      initialPage: widget.items.length * 1000 + _currentIndex,
      viewportFraction: viewportFraction,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        setState(() {
          _isReady = true;
        });
        _pageController.addListener(_pageListener);
      }
    });
  }

  @override
  void dispose() {
    _pageController.removeListener(_pageListener);
    _pageController.dispose();
    super.dispose();
  }

  void _pageListener() {
    if (!_pageController.hasClients || !_isReady) return;

    final page = _pageController.page ?? 0;
    final newIndex =
        (page.round() % widget.items.length + widget.items.length) %
            widget.items.length;

    if (newIndex != _currentIndex) {
      setState(() {
        _currentIndex = newIndex;
        _hasScrolled = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!_isReady) {
      return SizedBox(
        height: widget.height,
        child: const Center(child: CircularProgressIndicator()),
      );
    }

    final screenWidth = MediaQuery.of(context).size.width;
    final sideItemWidth = (screenWidth - widget.itemWidth) / 2;

    return Padding(
      padding: widget.padding,
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          SizedBox(
            height: widget.height,
            child: PageView.builder(
              controller: _pageController,
              itemBuilder: (context, index) {
                return AnimatedBuilder(
                  animation: _pageController,
                  builder: (context, child) {
                    double scale = 0.7;
                    double opacity = 0.6;
                    double width = sideItemWidth;

                    if (!_hasScrolled && index == _pageController.initialPage) {
                      scale = 1.0;
                      opacity = 1.0;
                      width = screenWidth;
                    } else if (_pageController.position.hasContentDimensions) {
                      final page = _pageController.page ?? 0;
                      final diff = (index - page).abs();

                      if (diff < 0.5) {
                        scale = 1.0;
                        opacity = 1.0;
                        width = widget.itemWidth;
                      } else if (diff < 1.5) {
                        scale = 0.7;
                        opacity = 0.6;
                        width = sideItemWidth;
                      }
                    }

                    return Center(
                      child: Transform.scale(
                        scale: scale,
                        child: Opacity(
                          opacity: opacity,
                          child: GestureDetector(
                            onTap: () {
                              final targetPage =
                                  (index ~/ widget.items.length) *
                                          widget.items.length +
                                      (index % widget.items.length);
                              _pageController.animateToPage(
                                targetPage,
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeInOut,
                              );
                            },
                            child: SizedBox(
                              width: width,
                              child: widget.items[index % widget.items.length],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          Positioned(
            bottom: widget.bottomDotPadding,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List<Widget>.generate(widget.items.length, (index) {
                return Container(
                  width: widget.dotSize,
                  height: widget.dotSize,
                  margin: EdgeInsets.symmetric(horizontal: widget.dotSpacing),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _currentIndex == index
                        ? widget.activeDotColor
                        : widget.inactiveDotColor.withOpacity(0.5),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
