import 'package:dribbble_real_estate_ui/config/components/reusable_animation.dart';
import 'package:dribbble_real_estate_ui/config/components/slide_up_animation.dart';
import 'package:dribbble_real_estate_ui/config/constants/colors.dart';
import 'package:dribbble_real_estate_ui/config/constants/lists.dart';
import 'package:dribbble_real_estate_ui/core/mixins/map_mixin.dart';
import 'package:dribbble_real_estate_ui/core/service/marker_service.dart';
import 'package:dribbble_real_estate_ui/widgets/bottom_bar.dart';
import 'package:dribbble_real_estate_ui/widgets/search_field.dart';
import 'package:dribbble_real_estate_ui/widgets/variant_pill.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => SearchScreenState();
}

class SearchScreenState extends State<SearchScreen> with MapMixin {
  final MarkerService _markerService = MarkerService();
  final LatLng _center = const LatLng(6.5176, 3.3862);
  late Future<Set<Marker>> _markersFuture;
  Set<Marker> _currentMarkers = {};
  bool _mapReady = false;

  @override
  void initState() {
    super.initState();
    loadMapStyle('assets/maps_theme/dark_theme.json');
    _markersFuture = _markerService.generateMarkers(
      positions: AppLists.markerPositions,
      icons: AppLists.markerIcons,
      onMarkerTap: _handleMarkerTap,
      backgroundColor: AppColors.orangeShade,
      iconColor: AppColors.white,
      borderColor: AppColors.orangeShade,
    );
    _markersFuture.then((markers) {
      if (mounted) setState(() => _currentMarkers = markers);
    });
  }

  void _handleMarkerTap(int index) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Tapped marker ${index + 1}')),
    );
  }

  @override
  void onMapCreated(GoogleMapController controller) {
    super.onMapCreated(controller);
    setState(() => _mapReady = true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Show map before markers are loaded
          GoogleMap(
            onMapCreated: onMapCreated,
            initialCameraPosition: CameraPosition(
              target: _center,
              zoom: 17.0,
            ),
            myLocationEnabled: true,
            myLocationButtonEnabled: true,
            zoomGesturesEnabled: true,
            zoomControlsEnabled: false,
            scrollGesturesEnabled: true,
            tiltGesturesEnabled: true,
            rotateGesturesEnabled: true,
            mapType: MapType.normal,
            markers: _currentMarkers,
          ),

          // Show loading indicator until markers are loaded
          if (!_mapReady || _currentMarkers.isEmpty)
            const Center(child: CircularProgressIndicator()),

          Positioned(
            top: 20,
            left: 16,
            right: 16,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: const SearchField(),
            ),
          ),

          Positioned(
            bottom: 100,
            left: 16,
            right: 16,
            child: ReusableAnimation(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _floatingButton(Icons.layers_outlined),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _floatingButton(Icons.my_location),
                      const VariantsPill(),
                    ],
                  ),
                ],
              ),
            ),
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

  Widget _floatingButton(IconData icon) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.darkTone.withOpacity(0.8),
        shape: BoxShape.circle,
      ),
      child: Icon(icon, color: AppColors.white),
    );
  }
}
