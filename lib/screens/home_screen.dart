import 'package:dribbble_real_estate_ui/config/components/slide_up_animation.dart';
import 'package:dribbble_real_estate_ui/widgets/custom_app_bar.dart';
import 'package:dribbble_real_estate_ui/widgets/extended_app_bar.dart';
import 'package:dribbble_real_estate_ui/widgets/location_list.dart';
import 'package:flutter/material.dart';
import 'package:dribbble_real_estate_ui/widgets/bottom_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Shared gradient background
          CustomScrollView(
            slivers: [
              // First SliverAppBar (transparent background)
              CustomAppBar(),

              // Second SliverAppBar (transparent background)
              ExtendedAppBar(),

              // Content section
              LocationList(),
            ],
          ),

          // Bottom Nav with reusable animation
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: SlideUpAnimation(
              child: const CustomBottomNavBar(),
            ),
          ),
        ],
      ),
    );
  }
}

