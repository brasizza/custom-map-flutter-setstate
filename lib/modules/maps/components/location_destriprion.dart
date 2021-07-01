import 'package:custommarker/app/data/model/location_model.dart';
import 'package:flutter/material.dart';

class LocationDesription extends StatelessWidget {
  final LocationModel location;
  const LocationDesription(this.location, {Key? key, z}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              location.placeName!,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          (location.placePicture == null)
              ? Image.asset('assets/images/dash.png')
              : Image.network(
                  location.placePicture!,
                  width: 300,
                  alignment: Alignment.bottomLeft,
                ),
          Flexible(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(location.description!),
          ))
        ],
      ),
    );
  }
}
