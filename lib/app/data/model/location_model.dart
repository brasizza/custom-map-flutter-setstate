import 'package:json_annotation/json_annotation.dart';

part 'location_model.g.dart';

@JsonSerializable()
class LocationModel {
  @JsonKey(name: 'place_name')
  final String? placeName;
  final double? lat;
  final double? lng;
  @JsonKey(name: 'place_picture')
  final String? placePicture;
  final String? description;
  LocationModel({
    this.placeName,
    this.lat,
    this.lng,
    this.placePicture,
    this.description,
  });

  factory LocationModel.fromJson(Map<String, dynamic> json) => _$LocationModelFromJson(json);
  Map<String, dynamic> toJson() => _$LocationModelToJson(this);
}
