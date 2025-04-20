import 'package:dribbble_real_estate_ui/widgets/location_button.dart';
import 'package:flutter/material.dart';

Widget buildLargeCard(String image, String address) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(24),
    child: Stack(
      children: [
        Image.asset(
          image,
          height: 200,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        Positioned(
          left: 16,
          right: 16,
          bottom: 10,
          child: LocationButton(address: address),
        ),
      ],
    ),
  );
}

Widget buildSmallCard(String image, String address) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(16),
    child: Stack(
      children: [
        Image.asset(
          image,
          height: 120,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        Positioned(
          left: 16,
          right: 16,
          bottom: 10,
          child: LocationButton(address: address),
        ),
      ],
    ),
  );
}
