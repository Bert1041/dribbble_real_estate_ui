import 'dart:ui' as ui;

import 'package:dribbble_real_estate_ui/widgets/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => SearchScreenState();
}

class SearchScreenState extends State<SearchScreen> {
  // List of marker positions (example coordinates)
  final List<LatLng> _markerPositions = [
    const LatLng(6.5244, 3.3792), // Lagos center
    const LatLng(6.5344, 3.3892), // Nearby location 1
    const LatLng(6.5144, 3.3692), // Nearby location 2
    const LatLng(6.5444, 3.3592), // Nearby location 3
    const LatLng(6.5044, 3.3992), // Nearby location 4
    const LatLng(6.5544, 3.3492), // Nearby location 5
  ];

  // List of icons for each marker
  final List<IconData> _markerIcons = [
    Icons.home,
    Icons.apartment,
    Icons.business,
    Icons.hotel,
    Icons.store,
    Icons.villa,
  ];

  late GoogleMapController mapController;
  String? _mapStyle;
  bool _isDarkTheme = true; // Track theme state

  final LatLng _center = const LatLng(6.5244, 3.3792); // Lagos, Nigeria

  @override
  void initState() {
    super.initState();
    _loadMapStyle();
  }

  Future<void> _loadMapStyle() async {
    if (_isDarkTheme) {
      _mapStyle = await rootBundle.loadString(
        'assets/maps_theme/dark_theme.json',
      );
    }
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    if (_mapStyle != null) {
      controller.setMapStyle(_mapStyle);
    }
  }

  void _toggleMapTheme() async {
    setState(() {
      _isDarkTheme = !_isDarkTheme;
    });
    await _loadMapStyle();
    if (_mapStyle != null) {
      mapController.setMapStyle(_mapStyle);
    } else {
      mapController.setMapStyle(null); // Revert to default
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(target: _center, zoom: 11.0),
            myLocationEnabled: true,
            myLocationButtonEnabled: true,
            zoomGesturesEnabled: false,
            zoomControlsEnabled: false,
            mapType: MapType.normal,
            markers: Set<Marker>.from(
              _markerPositions.asMap().entries.map((entry) async {
                final index = entry.key;
                final position = entry.value;
                return Marker(
                  markerId: MarkerId('marker_$index'),
                  position: position,
                  icon: BitmapDescriptor.fromBytes(
                    await _convertWidgetToBitmap(
                      _buildCustomMarker(_markerIcons[index], index),
                    ),
                  ),
                  onTap: () {
                    // Handle marker tap
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Tapped marker ${index + 1}')),
                    );
                  },
                );
              }),
            ),
          ),

          // Top search bar
          Positioned(
            top: 20,
            left: 16,
            right: 16,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    height: 50,
                    decoration: BoxDecoration(
                      color: _isDarkTheme ? Colors.grey[900] : Colors.white,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.search,
                          color: _isDarkTheme ? Colors.white70 : Colors.black54,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'Saint Petersburg',
                          style: TextStyle(
                            color: _isDarkTheme ? Colors.white : Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                GestureDetector(
                  onTap: _toggleMapTheme,
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: _isDarkTheme ? Colors.grey[900] : Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      _isDarkTheme ? Icons.light_mode : Icons.dark_mode,
                      color: _isDarkTheme ? Colors.white : Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Floating buttons on bottom left
          Positioned(
            bottom: 120,
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
                    Container(
                      height: 50,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color:
                            _isDarkTheme
                                ? Colors.grey[900]!.withOpacity(0.95)
                                : Colors.white.withOpacity(0.95),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.menu,
                              color: _isDarkTheme ? Colors.white : Colors.black,
                            ),
                            padding: EdgeInsets.zero,
                            constraints: const BoxConstraints(),
                            iconSize: 24,
                          ),
                          Center(
                            child: Text(
                              "List of variants",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color:
                                    _isDarkTheme ? Colors.white : Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
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
      ),
    );
  }

  Widget _floatingButton(IconData icon) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: _isDarkTheme ? Colors.grey[900] : Colors.white,
        shape: BoxShape.circle,
      ),
      child: Icon(icon, color: _isDarkTheme ? Colors.white : Colors.black87),
    );
  }

  Widget _buildCustomMarker(IconData icon, int index) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.orange.withOpacity(0.9),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white, width: 2),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Center(child: Icon(icon, color: Colors.white, size: 30)),
    );
  }
}

Future<Uint8List> _convertWidgetToBitmap(Widget widget) async {
  final RenderRepaintBoundary boundary = RenderRepaintBoundary();
  final RenderView renderView = RenderView(
    view: WidgetsBinding.instance.window,
    child: RenderPositionedBox(alignment: Alignment.center, child: boundary),
    configuration: ViewConfiguration(
      // size: const Size(50, 50),
      devicePixelRatio: WidgetsBinding.instance.window.devicePixelRatio,
    ),
  );

  final PipelineOwner pipelineOwner = PipelineOwner();
  final BuildOwner buildOwner = BuildOwner();

  pipelineOwner.rootNode = renderView;
  renderView.prepareInitialFrame();

  final RenderObjectToWidgetElement<RenderBox> rootElement =
      RenderObjectToWidgetAdapter<RenderBox>(
        container: renderView,
        child: widget,
      ).attachToRenderTree(buildOwner);

  buildOwner.buildScope(rootElement);
  buildOwner.finalizeTree();

  pipelineOwner.flushLayout();
  pipelineOwner.flushCompositingBits();
  pipelineOwner.flushPaint();

  final ui.Image image = await boundary.toImage(pixelRatio: 3.0);
  final ByteData? byteData = await image.toByteData(
    format: ui.ImageByteFormat.png,
  );
  return byteData!.buffer.asUint8List();
}
