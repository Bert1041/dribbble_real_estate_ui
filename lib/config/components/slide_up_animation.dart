import 'package:flutter/material.dart';

class SlideUpAnimation extends StatefulWidget {
  final Widget child;
  final Duration duration;
  final Curve curve;
  final Duration delay;

  const SlideUpAnimation({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 1500),
    this.curve = Curves.easeOutQuart,
    this.delay = Duration.zero,
  });

  @override
  State<SlideUpAnimation> createState() => _SlideUpAnimationState();
}

class _SlideUpAnimationState extends State<SlideUpAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    );

    _offsetAnimation = Tween<Offset>(
      begin: const Offset(0, 1), // Start from bottom
      end: Offset.zero,         // End at final position
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: widget.curve,
    ));

    // Start animation after optional delay
    Future.delayed(widget.delay, () {
      if (mounted) {
        _controller.forward();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _offsetAnimation,
      child: widget.child,
    );
  }
}