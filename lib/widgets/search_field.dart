import 'package:dribbble_real_estate_ui/constants/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchField extends StatelessWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            height: 45.h,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Row(
              children: [
                Icon(CupertinoIcons.search, color: AppColors.blackShade),
                const SizedBox(width: 8),
                Expanded(
                  child: TextFormField(
                    style: TextStyle(
                      fontFamily: 'Montserrat-Bold',
                      color: AppColors.blackShade,
                    ),
                    decoration: InputDecoration(
                      hintText: 'Saint Petersburg',
                      hintStyle: TextStyle(
                        fontFamily: 'Montserrat-Bold',
                        color: AppColors.blackShade.withOpacity(0.5),
                      ),
                      border: InputBorder.none,
                      isDense: true,
                      contentPadding: EdgeInsets.zero,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

        const SizedBox(width: 6),
        GestureDetector(
          child: Container(
            height: 45.h,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.white,
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.tune, color: AppColors.blackShade),
          ),
        ),
      ],
    );
  }
}
