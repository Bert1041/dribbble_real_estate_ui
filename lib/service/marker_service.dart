import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MarkerService {
  final Map<int, Uint8List> _markerBitmapCache = {};

  Future<BitmapDescriptor> createCustomMarkerIcon({
    required IconData icon,
    required Color backgroundColor,
    required Color iconColor,
    required Color borderColor,
    required int index,
    double width = 100.0,
    double height = 100.0,
    double cornerRadius = 30.0,
  }) async {
    if (_markerBitmapCache.containsKey(index)) {
      return BitmapDescriptor.fromBytes(_markerBitmapCache[index]!);
    }

    try {
      final ui.PictureRecorder pictureRecorder = ui.PictureRecorder();
      final Canvas canvas = Canvas(pictureRecorder);

      final Paint paint = Paint()..color = backgroundColor;
      final Paint borderPaint = Paint()
        ..color = borderColor
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2.0;

      final RRect rrect = RRect.fromRectAndCorners(
        Rect.fromLTWH(0, 0, width.w, height.h),
        topLeft: Radius.circular(cornerRadius),
        topRight: Radius.circular(cornerRadius),
        bottomRight: Radius.circular(cornerRadius),
        bottomLeft: Radius.zero,
      );

      canvas.drawRRect(rrect, paint);
      canvas.drawRRect(rrect, borderPaint);

      final TextPainter textPainter = TextPainter(
        textDirection: TextDirection.ltr,
      );
      textPainter.text = TextSpan(
        text: String.fromCharCode(icon.codePoint),
        style: TextStyle(
          fontSize: 60.0.sp,
          color: iconColor,
          fontFamily: icon.fontFamily,
        ),
      );
      textPainter.layout();
      textPainter.paint(
        canvas,
        Offset(
          (width.w - textPainter.width) / 2,
          (height.h - textPainter.height) / 2,
        ),
      );

      final ui.Image image = await pictureRecorder.endRecording().toImage(
        width.w.toInt(),
        height.h.toInt(),
      );
      final ByteData? byteData = await image.toByteData(
        format: ui.ImageByteFormat.png,
      );
      final Uint8List uint8List = byteData!.buffer.asUint8List();

      _markerBitmapCache[index] = uint8List;
      return BitmapDescriptor.fromBytes(uint8List);
    } catch (e) {
      debugPrint('Error creating marker icon: $e');
      return BitmapDescriptor.defaultMarker;
    }
  }

  Future<Set<Marker>> generateMarkers({
    required List<LatLng> positions,
    required List<IconData> icons,
    required Function(int) onMarkerTap,
    required Color backgroundColor,
    required Color iconColor,
    required Color borderColor,
  }) async {
    final Set<Marker> markers = {};

    for (int i = 0; i < positions.length; i++) {
      final icon = await createCustomMarkerIcon(
        icon: icons[i],
        backgroundColor: backgroundColor,
        iconColor: iconColor,
        borderColor: borderColor,
        index: i,
      );

      markers.add(
        Marker(
          markerId: MarkerId('marker_$i'),
          position: positions[i],
          icon: icon,
          onTap: () => onMarkerTap(i),
        ),
      );
    }

    return markers;
  }
}