import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ReusableAnimation extends StatefulWidget {
  final Duration duration;
  final Curve curve;
  final double maxWidth;
  final Widget child;

  const ReusableAnimation({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 1500),
    this.curve = Curves.easeOutBack,
    this.maxWidth = double.infinity,
  });

  @override
  State<ReusableAnimation> createState() => _ReusableAnimationState();
}

class _ReusableAnimationState extends State<ReusableAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _widthAnimation;
  late Animation<double> _opacityAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(duration: widget.duration, vsync: this);

    _widthAnimation = Tween<double>(
      begin: 0,
      end: widget.maxWidth,
    ).animate(CurvedAnimation(parent: _controller, curve: widget.curve));

    _opacityAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.2, 1.0, curve: Curves.easeIn),
      ),
    );

    _scaleAnimation = Tween<double>(
      begin: 0.8,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        final clampedOpacity = _opacityAnimation.value.clamp(0.0, 1.0);

        return Opacity(
          opacity: clampedOpacity,
          child: Transform.scale(
            scale: _scaleAnimation.value,
            alignment: Alignment.centerLeft,
            child: SizedBox(
              width: _widthAnimation.value,
              child: widget.child,
            ),
          ),
        );
      },
    );
  }
}
