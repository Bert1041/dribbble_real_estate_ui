import 'package:dribbble_real_estate_ui/constants/colors.dart';
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
              SliverAppBar(
                pinned: true,
                expandedHeight: 200,
                toolbarHeight: 200,
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
                                      fontSize: 14,
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
                        const SizedBox(height: 10),
                        const Text(
                          "Hi, Marina",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            color: AppColors.brownText,
                            fontFamily: 'Montserrat-Bold',
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.6,
                          child: const Text(
                            "let's select your perfect place",
                            maxLines: 2,
                            style: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.w400,
                              color: AppColors.blackShade,
                              fontFamily: 'Montserrat-Bold',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              // Second SliverAppBar (transparent background)
              SliverAppBar(
                pinned: false,
                floating: false,
                snap: false,
                toolbarHeight: 200.0,
                expandedHeight: 200.0,
                flexibleSpace: FlexibleSpaceBar(
                  background: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomCenter,
                        colors: [ AppColors.warmShade, AppColors.lightTone,],
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20.0,
                      vertical: 10.0,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // BUY container
                            Expanded(
                              child: Container(
                                width: 180,
                                height: 180,
                                padding: const EdgeInsets.symmetric(
                                  vertical: 12,
                                ),
                                decoration: BoxDecoration(
                                  color: AppColors.orangeShade,
                                  shape: BoxShape.circle,
                                ),
                                child: const Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      'BUY',
                                      style: TextStyle(
                                        color: AppColors.white,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14,
                                        fontFamily: 'Montserrat-Bold',
                                      ),
                                    ),
                                    Spacer(),
                                    Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          '1 034',
                                          style: TextStyle(
                                            color: AppColors.white,
                                            fontWeight: FontWeight.w900,
                                            fontSize: 35,
                                            fontFamily: 'Montserrat-Bold',
                                          ),
                                        ),
                                        Text(
                                          'offers',
                                          style: TextStyle(
                                            color: AppColors.white,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 14,
                                            fontFamily: 'Montserrat-Bold',
                                          ),
                                        ),
                                      ],
                                    ),
                                    Spacer(),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(width: 16),
                            // RENT container
                            Expanded(
                              child: Container(
                                width: 160,
                                height: 160,
                                padding: const EdgeInsets.symmetric(
                                  vertical: 12,
                                ),
                                decoration: BoxDecoration(
                                  color: AppColors.white,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: const Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      'RENT',
                                      style: TextStyle(
                                        color: AppColors.brownText,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14,
                                        fontFamily: 'Montserrat-Bold',
                                      ),
                                    ),
                                    Spacer(),
                                    Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          '2 212',
                                          style: TextStyle(
                                            color: AppColors.brownText,
                                            fontWeight: FontWeight.w900,
                                            fontSize: 35,
                                            fontFamily: 'Montserrat-Bold',
                                          ),
                                        ),
                                        Text(
                                          'offers',
                                          style: TextStyle(
                                            color: AppColors.brownText,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 14,
                                            fontFamily: 'Montserrat-Bold',
                                          ),
                                        ),
                                      ],
                                    ),
                                    Spacer(),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              // Content section with white background
              SliverToBoxAdapter(
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(24),
                    ),
                  ),
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 12),
                      _buildLargeCard('assets/images/apt1.jpg', 'Gladkova St., 25'),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(child: _buildSmallCard('assets/images/apt2.jpg', 'Trefoleva St., 43')),
                          const SizedBox(width: 12),
                          Expanded(child: _buildSmallCard('assets/images/apt3.jpg', 'Kirova St., 14')),
                        ],
                      ),
                      const SizedBox(height: 12),
                      _buildLargeCard('assets/images/apt1.jpg', 'Gladkova St., 25'),
                      const SizedBox(height: 16),

                      Row(
                        children: [
                          Expanded(child: _buildSmallCard('assets/images/apt2.jpg', 'Trefoleva St., 43')),
                          const SizedBox(width: 12),
                          Expanded(child: _buildSmallCard('assets/images/apt3.jpg', 'Kirova St., 14')),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          Expanded(child: _buildSmallCard('assets/images/apt2.jpg', 'Trefoleva St., 43')),
                          const SizedBox(width: 12),
                          Expanded(child: _buildSmallCard('assets/images/apt3.jpg', 'Kirova St., 14')),
                        ],
                      ),
                      const SizedBox(height: 120),
                    ],
                  ),
                ),
              ),
            ],
          ),

          // Bottom Nav
          const Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: CustomBottomNavBar(),
          ),
        ],
      ),
    );
  }

}

Widget _buildLargeCard(String image, String address) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(24),
    child: Stack(
      children: [
        Image.asset(image, height: 200, width: double.infinity, fit: BoxFit.cover),
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.8),
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(40),
                bottomRight: Radius.circular(40),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(address, style: const TextStyle(fontWeight: FontWeight.bold)),
                const Icon(Icons.arrow_forward_ios_rounded, size: 16),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

Widget _buildSmallCard(String image, String address) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(16),
    child: Stack(
      children: [
        Image.asset(image, height: 120, width: double.infinity, fit: BoxFit.cover),
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.9),
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(40),
                bottomRight: Radius.circular(40),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(child: Text(address, overflow: TextOverflow.ellipsis)),
                const Icon(Icons.arrow_forward_ios_rounded, size: 14),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
