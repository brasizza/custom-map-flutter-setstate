import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';

import 'package:custommarker/app/data/model/location_model.dart';
import 'package:custommarker/app/data/model/map_type.dart';
import 'package:custommarker/app/data/repository/map_repository.dart';
import 'package:flutter/services.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapsController {
  late LatLng initialPositionMap;
  final MapRepository _repository = MapRepository();

  Set<Marker> markers = {};
  void setInitialPosition(double lat, double lng) {
    initialPositionMap = LatLng(lat, lng);
  }

  Future<Set<Marker>> getData(MyMapTyes type) async {
    return await generateMarkers(type, await _repository.getData());
  }

  Future<Set<Marker>> generateMarkers(MyMapTyes type, List<LocationModel> locations) async {
    markers.clear();
    await Future.forEach(locations, (LocationModel location) async {
      Marker _mark = await _generateMarker(type, location);
      markers.add(_mark);
    });
    return markers;
  }

  Future<Marker> _generateMarker(MyMapTyes type, LocationModel location) async {
    late BitmapDescriptor _icon;
    if (type == MyMapTyes.regular) {
      _icon = BitmapDescriptor.defaultMarker;
    } else {
      _icon = await _markerCusomImage(location.placePicture);
    }
    Marker marker = Marker(markerId: MarkerId(location.hashCode.toString()), position: LatLng((location.lat ?? 0), location.lng ?? 0), icon: (_icon), onTap: () {});
    return marker;
  }

  Future<Uint8List> readFileBytes(String path) async {
    ByteData fileData = await rootBundle.load(path);
    Uint8List fileUnit8List = fileData.buffer.asUint8List(fileData.offsetInBytes, fileData.lengthInBytes);
    return fileUnit8List;
  }

  Future<Uint8List> _getImageFromAsset(String iconPath) async {
    return await readFileBytes("./assets/images/$iconPath.png");
  }

  Future<BitmapDescriptor> _markerCusomImage(String? placePicture) async {
    late Uint8List _imageByte;
    if (placePicture == null) {
      _imageByte = await _getImageFromAsset('dash');
    } else {
      final File markerImageFile = await DefaultCacheManager().getSingleFile(placePicture);
      _imageByte = await markerImageFile.readAsBytes();
    }
    final int targetWidth = 80;

    final Codec markerImageCodec = await instantiateImageCodec(
      _imageByte,
      targetWidth: targetWidth,
    );
    final FrameInfo frameInfo = await markerImageCodec.getNextFrame();
    final ByteData? byteData = await frameInfo.image.toByteData(
      format: ImageByteFormat.png,
    );
    final Uint8List resizedMarkerImageBytes = byteData!.buffer.asUint8List();
    return BitmapDescriptor.fromBytes(resizedMarkerImageBytes);
  }
}
