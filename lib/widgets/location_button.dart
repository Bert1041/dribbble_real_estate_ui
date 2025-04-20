import 'package:dribbble_real_estate_ui/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LocationButton extends StatelessWidget {
  final String address;

  const LocationButton({super.key, required this.address});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 40.h,
        padding: EdgeInsets.only(left: 16.0),
        decoration: BoxDecoration(
          color: Colors.white24.withOpacity(0.6), // soft silver
          borderRadius: BorderRadius.circular(50.0),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Center(
              child: Text(
                address,
                style: TextStyle(
                  fontSize: 14.0.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.blackShade,
                  fontFamily: 'Montserrat-Bold',
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Positioned(
              right: 0,
              child: Container(
                padding: const EdgeInsets.all(15.0),
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
          ],
        ),
      ),
    );
  }
}
