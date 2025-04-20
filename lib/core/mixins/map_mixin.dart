import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

mixin MapMixin {
  late GoogleMapController mapController;
  String? mapStyle;

  Future<void> loadMapStyle(String stylePath) async {
    try {
      mapStyle = await rootBundle.loadString(stylePath);
      mapController.setMapStyle(mapStyle);
        } catch (e) {
      debugPrint('Error loading map style: $e');
    }
  }

  void onMapCreated(GoogleMapController controller) {
    mapController = controller;
    if (mapStyle != null) {
      controller.setMapStyle(mapStyle);
    }
  }
}