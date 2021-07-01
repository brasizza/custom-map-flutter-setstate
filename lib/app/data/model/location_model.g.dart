// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocationModel _$LocationModelFromJson(Map<String, dynamic> json) {
  return LocationModel(
    placeName: json['place_name'] as String?,
    lat: (json['lat'] as num?)?.toDouble(),
    lng: (json['lng'] as num?)?.toDouble(),
    placePicture: json['place_picture'] as String?,
    description: json['description'] as String?,
  );
}

Map<String, dynamic> _$LocationModelToJson(LocationModel instance) =>
    <String, dynamic>{
      'place_name': instance.placeName,
      'lat': instance.lat,
      'lng': instance.lng,
      'place_picture': instance.placePicture,
      'description': instance.description,
    };
