import 'package:elektronik_disposisi_management/model/map_model.dart';
import 'package:elektronik_disposisi_management/providers/general_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';

final mapController = StateNotifierProvider<MapController, List<MapModel>>((ref) {
  return MapController(ref.read);
});

class MapController extends StateNotifier<List<MapModel>> {
  MapController(this._read) : super([]);
  final Reader _read;
  addMarker(LatLng position) {
    if (_read(isClickedProvider)) {
      print(isClickedProvider);
      state.removeLast();
    }
    MapModel newMarker = MapModel(
      marker: Marker(
        width: 50.0,
        height: 50.0,
        point: position,
        builder: (ctx) => IconButton(onPressed: () {}, icon: const Icon(Icons.keyboard_double_arrow_down_rounded)),
      ),
      circle: CircleMarker(
        color: Colors.blue.withOpacity(0.5),
        borderStrokeWidth: 1,
        useRadiusInMeter: true,
        point: position,
        radius: 250,
      ),
    );
    state = [...state, newMarker];
  }
}
