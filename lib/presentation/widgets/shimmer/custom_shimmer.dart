import 'package:flutter/material.dart';

class CustomShimmer extends StatefulWidget {
  final double width;
  final double height;
  final EdgeInsetsGeometry? margin;
  final List<BoxShadow>? boxShadow;
  final BorderRadiusGeometry? borderRadius;
  final BoxBorder? border;
  const CustomShimmer({
    super.key,
    required this.width,
    required this.height,
    this.margin,
    this.boxShadow,
    this.borderRadius,
    this.border,
  });

  @override
  _CustomShimmerState createState() => _CustomShimmerState();
}

class _CustomShimmerState extends State<CustomShimmer>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _animation = Tween<double>(begin: -1.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.linear,
      ),
    );

    _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return Container(
            width: widget.width,
            height: widget.height,
            margin: widget.margin ?? EdgeInsets.zero,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment(-1 + _animation.value, 0),
                end: Alignment(1 + _animation.value, 0),
                colors: [
                  Colors.grey[300]!,
                  Colors.grey[100]!,
                  Colors.grey[300]!,
                ],
                stops: const [0.3, 0.5, 0.7],
              ),
              borderRadius: widget.borderRadius ??
                  const BorderRadius.all(Radius.circular(8)),
              boxShadow: widget.boxShadow,
              border: widget.border,
            ),
          );
        },
      ),
    );
  }
}
