import 'package:dribbble_real_estate_ui/config/components/slide_up_animation.dart';
import 'package:dribbble_real_estate_ui/widgets/bottom_bar.dart';
import 'package:flutter/material.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Main content
          Center(child: Text('Favorites Screen')),

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
