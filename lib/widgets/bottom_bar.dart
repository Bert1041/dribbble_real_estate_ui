import 'package:dribbble_real_estate_ui/config/constants/colors.dart';
import 'package:dribbble_real_estate_ui/core/state/cubit/navigation_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    // final currentIndex = context.watch<NavigationCubit>().state;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 55, vertical: 20),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
        decoration: BoxDecoration(
          color: AppColors.blackShade100,
          borderRadius: BorderRadius.circular(40),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildItem(context, CupertinoIcons.search, 0),
            _buildItem(context, CupertinoIcons.chat_bubble_text_fill, 1),
            _buildItem(context, CupertinoIcons.house_alt_fill, 2),
            _buildItem(context, CupertinoIcons.heart_fill, 3),
            _buildItem(context, CupertinoIcons.person_fill, 4),
          ],
        ),
      ),
    );
  }

  Widget _buildItem(BuildContext context, IconData icon, int index) {
    final isActive = context.watch<NavigationCubit>().state == index;

    return InkWell(
      onTap: () => context.read<NavigationCubit>().changeTab(index),
      child: Container(
        width: 45.w,
        height: 45.h,
        decoration: BoxDecoration(
          color: isActive ? AppColors.orangeShade : AppColors.blackShade,
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: AppColors.white),
      ),
    );
  }
}
