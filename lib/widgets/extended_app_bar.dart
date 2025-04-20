import 'package:dribbble_real_estate_ui/config/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AnimatedStatContainer extends StatefulWidget {
  final String title;
  final int value;
  final String suffix;
  final Color textColor;
  final Color containerColor;
  final bool isCircle;

  const AnimatedStatContainer({
    super.key,
    required this.title,
    required this.value,
    required this.suffix,
    required this.textColor,
    required this.containerColor,
    this.isCircle = false,
  });

  @override
  State<AnimatedStatContainer> createState() => _AnimatedStatContainerState();
}

class _AnimatedStatContainerState extends State<AnimatedStatContainer>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<int> _valueAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    _valueAnimation = IntTween(begin: 0, end: widget.value).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOut,
      ),
    );

    _scaleAnimation = Tween<double>(begin: 0.5, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.elasticOut,
      ),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  String _formatNumber(int number) {
    return number.toString().replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
          (Match m) => '${m[1]} ',
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Transform.scale(
          scale: _scaleAnimation.value,
          child: Container(
            width: widget.isCircle ? 180.w : 160.w,
            height: widget.isCircle ? 180.h : 160.h,
            padding: const EdgeInsets.symmetric(
              vertical: 24,
            ),
            decoration: widget.isCircle
                ? BoxDecoration(
              color: widget.containerColor,
              shape: BoxShape.circle,
            )
                : BoxDecoration(
              color: widget.containerColor.withOpacity(0.7),
              borderRadius: BorderRadius.circular(24),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  widget.title,
                  style: TextStyle(
                    color: widget.textColor,
                    fontWeight: FontWeight.w400,
                    fontSize: 14.sp,
                    fontFamily: 'Montserrat-Bold',
                  ),
                ),
                const Spacer(),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      _formatNumber(_valueAnimation.value),
                      style: TextStyle(
                        color: widget.textColor,
                        fontWeight: FontWeight.w800,
                        fontSize: 35.sp,
                        fontFamily: 'Montserrat-Bold',
                      ),
                    ),
                    Text(
                      widget.suffix,
                      style: TextStyle(
                        color: widget.textColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 14.sp,
                        fontFamily: 'Montserrat-Bold',
                      ),
                    ),
                  ],
                ),
                const Spacer(),
              ],
            ),
          ),
        );
      },
    );
  }
}

class ExtendedAppBar extends StatelessWidget {
  const ExtendedAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: false,
      floating: false,
      snap: false,
      toolbarHeight: 200.0.h,
      expandedHeight: 200.0.h,
      flexibleSpace: FlexibleSpaceBar(
        background: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomCenter,
              colors: [AppColors.warmShade, AppColors.lightTone],
            ),
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 20.0,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // BUY container
                  Expanded(
                    child: AnimatedStatContainer(
                      title: 'BUY',
                      value: 1034,
                      suffix: 'offers',
                      textColor: AppColors.white,
                      containerColor: AppColors.orangeShade,
                      isCircle: true,
                    ),
                  ),
                  const SizedBox(width: 16),
                  // RENT container
                  Expanded(
                    child: AnimatedStatContainer(
                      title: 'RENT',
                      value: 2212,
                      suffix: 'offers',
                      textColor: AppColors.brownText,
                      containerColor: AppColors.white,
                      isCircle: false,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}