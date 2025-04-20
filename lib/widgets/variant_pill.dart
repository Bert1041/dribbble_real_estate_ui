import 'package:dribbble_real_estate_ui/config/constants/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VariantsPill extends StatelessWidget {
  const VariantsPill({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45.h,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.darkTone.withOpacity(0.8),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          Icon(
            CupertinoIcons.list_bullet_indent,
            color: AppColors.white,
            size: 18,
          ),
          SizedBox(width: 8.w),
          Center(
            child: Text(
              "List of variants",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: AppColors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
