import 'package:dribbble_real_estate_ui/screens/chat_screen.dart';
import 'package:dribbble_real_estate_ui/screens/favorites_screen.dart';
import 'package:dribbble_real_estate_ui/screens/home_screen.dart';
import 'package:dribbble_real_estate_ui/screens/profile_screen.dart';
import 'package:dribbble_real_estate_ui/screens/search_screen.dart';
import 'package:dribbble_real_estate_ui/state/cubit/navigation_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final List<Widget> _screens = const [
    SearchScreen(),
    ChatScreen(),
    HomeScreen(),
    FavoritesScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationCubit, int>(
      builder: (context, currentIndex) {
        return Scaffold(body: SafeArea(child: _screens[currentIndex]));
      },
    );
  }
}
