import 'package:dribbble_real_estate_ui/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
              colors: [ AppColors.warmShade, AppColors.lightTone,],
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
                    child: Container(
                      width: 180.w,
                      height: 180.h,
                      padding: const EdgeInsets.symmetric(
                        vertical: 24,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.orangeShade,
                        shape: BoxShape.circle,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'BUY',
                            style: TextStyle(
                              color: AppColors.white,
                              fontWeight: FontWeight.w400,
                              fontSize: 14.sp,
                              fontFamily: 'Montserrat-Bold',
                            ),
                          ),
                          const Spacer(),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment:
                            CrossAxisAlignment.center,
                            children: [
                              Text(
                                '1 034',
                                style: TextStyle(
                                  color: AppColors.white,
                                  fontWeight: FontWeight.w800,
                                  fontSize: 35.sp,
                                  fontFamily: 'Montserrat-Bold',
                                ),
                              ),
                              Text(
                                'offers',
                                style: TextStyle(
                                  color: AppColors.white,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14.sp,
                                  fontFamily: 'Montserrat-Bold',
                                ),
                              ),
                            ],
                          ),
                          Spacer(),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  // RENT container
                  Expanded(
                    child: Container(
                      width: 160.w,
                      height: 160.h,
                      padding: const EdgeInsets.symmetric(
                        vertical: 12,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.white.withOpacity(0.7),
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child:  Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'RENT',
                            style: TextStyle(
                              color: AppColors.brownText,
                              fontWeight: FontWeight.w400,
                              fontSize: 14.sp,
                              fontFamily: 'Montserrat-Bold',
                            ),
                          ),
                          const Spacer(),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment:
                            CrossAxisAlignment.center,
                            children: [
                              Text(
                                '2 212',
                                style: TextStyle(
                                  color: AppColors.brownText,
                                  fontWeight: FontWeight.w800,
                                  fontSize: 35.sp,
                                  fontFamily: 'Montserrat-Bold',
                                ),
                              ),
                              Text(
                                'offers',
                                style: TextStyle(
                                  color: AppColors.brownText,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14.sp,
                                  fontFamily: 'Montserrat-Bold',
                                ),
                              ),
                            ],
                          ),
                          Spacer(),
                        ],
                      ),
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
