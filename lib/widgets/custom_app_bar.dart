import 'package:dribbble_real_estate_ui/config/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      expandedHeight: 200.h,
      toolbarHeight: 200.h,
      flexibleSpace: FlexibleSpaceBar(
        background: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomRight,
              colors: [AppColors.lightTone, AppColors.warmShade],
            ),
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 10.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.only(
                      left: 14,
                      right: 14,
                      top: 8,
                      bottom: 8,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.white.withOpacity(0.8),
                      border: Border.all(
                        width: 2,
                        color: AppColors.white,
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(8.0),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.03),
                          offset: const Offset(0, 4),
                          blurRadius: 12,
                          spreadRadius: 1,
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          color: AppColors.brownShade,
                          size: 16,
                        ),
                        const SizedBox(width: 3),
                        Text(
                          'Saint Petersburg',
                          style: TextStyle(
                            color: AppColors.brownShade,
                            fontSize: 14.sp,
                            fontFamily: 'Montserrat-Bold',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const CircleAvatar(
                    radius: 24,
                    backgroundImage: AssetImage(
                      'assets/images/avatar.png',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
               Text(
                "Hi, Marina",
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.brownText,
                  fontFamily: 'Montserrat-Bold',
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.6,
                child:  Text(
                  "let's select your perfect place",
                  maxLines: 2,
                  style: TextStyle(
                    fontSize: 28.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.blackShade,
                    fontFamily: 'Montserrat-Bold',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
