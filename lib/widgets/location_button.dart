import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dribbble_real_estate_ui/config/constants/colors.dart';

class LocationButton extends StatefulWidget {
  final String address;
  final Duration duration;
  final Curve curve;

  const LocationButton({
    super.key,
    required this.address,
    this.duration = const Duration(milliseconds: 2000),
    this.curve = Curves.easeOutQuart,
  });

  @override
  State<LocationButton> createState() => _LocationButtonState();
}

class _LocationButtonState extends State<LocationButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _widthAnimation;
  late Animation<double> _opacityAnimation;
  late Animation<Offset> _iconOffsetAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    );

    // Animation for the button width
    _widthAnimation = Tween<double>(
      begin: 60.w,  // Starting width (just enough for the icon)
      end: 200.w,   // Full width (adjust based on your needs)
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: widget.curve,
    ));

    // Animation for text opacity
    _opacityAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Interval(0.3, 1.0, curve: widget.curve),
    ));

    // Animation for icon position
    _iconOffsetAnimation = Tween<Offset>(
      begin: const Offset(-1.0, 0.0), // Starts from left outside
      end: Offset.zero,               // Ends at normal position
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: widget.curve,
    ));

    // Start animation when widget is built
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
    return GestureDetector(
      onTap: () {},
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Container(
            height: 40.h,
            width: _widthAnimation.value,
            padding: EdgeInsets.only(left: 16.0.w),
            decoration: BoxDecoration(
              color: Colors.white24.withOpacity(0.6),
              borderRadius: BorderRadius.circular(50.0),
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Address text that fades in
                Opacity(
                  opacity: _opacityAnimation.value,
                  child: Center(
                    child: Text(
                      widget.address,
                      style: TextStyle(
                        fontSize: 14.0.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.blackShade,
                        fontFamily: 'Montserrat-Bold',
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                // Animated icon
                Positioned(
                  right: 0,
                  child: SlideTransition(
                    position: _iconOffsetAnimation,
                    child: Container(
                      padding: EdgeInsets.all(15.0.w),
                      decoration: const BoxDecoration(
                        color: Color(0xFFfcf6ed),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.arrow_forward_ios,
                        size: 14.0,
                        color: AppColors.brownShade,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}