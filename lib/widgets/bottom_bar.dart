import 'package:dribbble_real_estate_ui/constants/colors.dart';
import 'package:dribbble_real_estate_ui/state/cubit/navigation_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    // final currentIndex = context.watch<NavigationCubit>().state;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        decoration: BoxDecoration(
          color: AppColors.blackShade,
          borderRadius: BorderRadius.circular(40),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildItem(context, Icons.search, 0),
            _buildItem(context, Icons.chat_bubble_outline, 1),
            _buildItem(context, Icons.home_filled, 2),
            _buildItem(context, Icons.favorite, 3),
            _buildItem(context, Icons.person, 4),
          ],
        ),
      ),
    );
  }

  Widget _buildItem(BuildContext context, IconData icon, int index) {
    final isActive = context.watch<NavigationCubit>().state == index;

    return GestureDetector(
      onTap: () => context.read<NavigationCubit>().changeTab(index),
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: isActive ? AppColors.orangeShade : AppColors.blackShade,
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: AppColors.white),
      ),
    );
  }
}
