import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeController {
  int initialPage = 0;
  late LatLng initialPositionMap;

  void changePage(int page) {
    initialPage = page;
  }
}
