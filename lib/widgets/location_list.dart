import 'package:dribbble_real_estate_ui/config/constants/colors.dart';
import 'package:dribbble_real_estate_ui/widgets/location_card.dart';
import 'package:flutter/material.dart';

class LocationList extends StatelessWidget {
  const LocationList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        decoration: const BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(30),
          ),
        ),
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildLargeCard(
              'assets/images/apt1.jpg',
              'Gladkova St., 25',
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: buildSmallCard(
                    'assets/images/apt2.jpg',
                    'Trefoleva St., 43',
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: buildSmallCard(
                    'assets/images/apt3.jpg',
                    'Kirova St., 14',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            buildLargeCard(
              'assets/images/apt1.jpg',
              'Gladkova St., 25',
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: buildSmallCard(
                    'assets/images/apt2.jpg',
                    'Trefoleva St., 43',
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: buildSmallCard(
                    'assets/images/apt3.jpg',
                    'Kirova St., 14',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: buildSmallCard(
                    'assets/images/apt2.jpg',
                    'Trefoleva St., 43',
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: buildSmallCard(
                    'assets/images/apt3.jpg',
                    'Kirova St., 14',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}
