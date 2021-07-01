import 'package:custommarker/app/data/model/location_model.dart';
import 'package:custommarker/app/data/model/map_type.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:custommarker/modules/home/home_controller.dart';
import 'package:custommarker/modules/maps/maps_controller.dart';

final MapsController controller = MapsController();

class MapsView extends StatefulWidget {
  final int page;
  const MapsView({
    Key? key,
    required this.page,
  }) : super(key: key);

  @override
  _MapsViewState createState() => _MapsViewState();
}

class _MapsViewState extends State<MapsView> {
  var _future;

  @override
  void initState() {
    super.initState();
    setState(() {
      controller.setInitialPosition(-23.5649267, -46.6519566);
    });
  }

  @override
  Widget build(BuildContext context) {
    _future = controller.getData((widget.page == 0 ? MyMapTyes.regular : MyMapTyes.custom));

    return FutureBuilder(
        future: _future,
        builder: (_, AsyncSnapshot<Set<Marker>> markersFuture) {
          switch (markersFuture.connectionState) {
            case ConnectionState.none:
              return Text("No data yet");
            case ConnectionState.waiting:
              return Center(child: CircularProgressIndicator());
            case ConnectionState.active:
              return Text("Almost there!");
            case ConnectionState.done:
              if (!markersFuture.hasData || markersFuture.hasError) {
                return Text("SOME ERROR there!");
              }
              return GoogleMap(
                mapType: MapType.normal,
                initialCameraPosition: CameraPosition(
                  target: controller.initialPositionMap,
                  zoom: 2,
                ),
                zoomControlsEnabled: true,
                markers: markersFuture.data!,
                myLocationEnabled: true,
                myLocationButtonEnabled: true,
                buildingsEnabled: false,
              );
          }
        });
  }
}
