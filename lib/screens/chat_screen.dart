import 'package:dribbble_real_estate_ui/main.dart';
import 'package:dribbble_real_estate_ui/state/cubit/navigation_cubit.dart';
import 'package:dribbble_real_estate_ui/widgets/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Main content
          Center(child: Text('Chat Screen')),

          // Bottom navigation
          const Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: CustomBottomNavBar(),
          ),
        ],
      ),
    );
  }
}
