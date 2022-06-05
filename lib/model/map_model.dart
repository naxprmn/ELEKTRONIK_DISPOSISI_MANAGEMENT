// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_map/flutter_map.dart';

class MapModel {
  Marker marker;
  CircleMarker circle;

  MapModel({
    required this.marker,
    required this.circle,
  });

  MapModel copyWith({
    Marker? marker,
    CircleMarker? circle,
  }) {
    return MapModel(
      marker: marker ?? this.marker,
      circle: circle ?? this.circle,
    );
  }

  @override
  String toString() => 'MapModel(marker: $marker, circle: $circle)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MapModel && other.marker == marker && other.circle == circle;
  }

  @override
  int get hashCode => marker.hashCode ^ circle.hashCode;
}
