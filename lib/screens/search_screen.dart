import 'dart:ui' as ui;

import 'package:dribbble_real_estate_ui/constants/colors.dart';
import 'package:dribbble_real_estate_ui/constants/lists.dart';
import 'package:dribbble_real_estate_ui/widgets/bottom_bar.dart';
import 'package:dribbble_real_estate_ui/widgets/search_field.dart';
import 'package:dribbble_real_estate_ui/widgets/variant_pill.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => SearchScreenState();
}

class SearchScreenState extends State<SearchScreen> {
  late GoogleMapController mapController;
  String? _mapStyle;

  final LatLng _center = const LatLng(6.5176, 3.3862);

  late Future<Set<Marker>> _markersFuture;

  @override
  void initState() {
    super.initState();
    _loadMapStyle();
    _markersFuture = _generateMarkers();
  }

  Future<void> _loadMapStyle() async {
    _mapStyle = await rootBundle.loadString(
      'assets/maps_theme/dark_theme.json',
    );
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    if (_mapStyle != null) {
      controller.setMapStyle(_mapStyle);
    }
  }

  Future<Set<Marker>> _generateMarkers() async {
    final Set<Marker> markers = {};

    for (int i = 0; i < AppLists.markerPositions.length; i++) {
      final position = AppLists.markerPositions[i];
      final icon = await _getMarkerIcon(AppLists.markerIcons[i], i);

      markers.add(
        Marker(
          markerId: MarkerId('marker_$i'),
          position: position,
          icon: icon,
          onTap: () {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text('Tapped marker ${i + 1}')));
          },
        ),
      );
    }

    return markers;
  }

  Future<BitmapDescriptor> _getMarkerIcon(IconData icon, int index) async {
    final ui.PictureRecorder pictureRecorder = ui.PictureRecorder();
    final Canvas canvas = Canvas(pictureRecorder);

    final Paint paint = Paint()..color = AppColors.orangeShade;
    final Paint borderPaint =
        Paint()
          ..color = AppColors.orangeShade
          ..style = PaintingStyle.stroke
          ..strokeWidth = 2.0;

    double width = 100.0.w;
    double height = 100.0.h;
    const double cornerRadius = 30.0;

    final RRect rrect = RRect.fromRectAndCorners(
      Rect.fromLTWH(0, 0, width, height),
      topLeft: const Radius.circular(cornerRadius),
      topRight: const Radius.circular(cornerRadius),
      bottomRight: const Radius.circular(cornerRadius),
      bottomLeft: Radius.zero, // No radius on bottom-right
    );

    canvas.drawRRect(rrect, paint);
    canvas.drawRRect(rrect, borderPaint);

    // Draw the icon
    final TextPainter textPainter = TextPainter(
      textDirection: TextDirection.ltr,
    );
    textPainter.text = TextSpan(
      text: String.fromCharCode(icon.codePoint),
      style: TextStyle(
        fontSize: 60.0.sp,
        color: AppColors.white,
        fontFamily: icon.fontFamily,
      ),
    );
    textPainter.layout();
    textPainter.paint(
      canvas,
      Offset(
        (width - textPainter.width) / 2,
        (height - textPainter.height) / 2,
      ),
    );

    // Convert canvas to image
    final ui.Image image = await pictureRecorder.endRecording().toImage(
      width.toInt(),
      height.toInt(),
    );
    final ByteData? byteData = await image.toByteData(
      format: ui.ImageByteFormat.png,
    );
    final Uint8List uint8List = byteData!.buffer.asUint8List();

    return BitmapDescriptor.fromBytes(uint8List);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<Set<Marker>>(
        future: _markersFuture,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          return Stack(
            children: [
              GoogleMap(
                onMapCreated: _onMapCreated,
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
                markers: snapshot.data!,
              ),

              // Rest of your UI code remains the same...
              Positioned(
                top: 20,
                left: 16,
                right: 16,
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: SearchField(),
                ),
              ),

              Positioned(
                bottom: 100,
                left: 16,
                right: 16,
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
                        VariantsPill(),
                      ],
                    ),
                  ],
                ),
              ),

              const Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: CustomBottomNavBar(),
              ),
            ],
          );
        },
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
