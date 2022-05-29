import 'package:elektronik_disposisi_management/model/cutom_marker_model.dart';
import 'package:elektronik_disposisi_management/repositories/services.dart';
import 'package:elektronik_disposisi_management/widget/bottom_sheet_map.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapProvider extends ChangeNotifier {
  final LatLng _center = LatLng(-7.47717, 110.21817); // center coordinates magelang
  final MapController _mapController = MapController();
  final List<Marker> _marker = [];
  final List<CircleMarker> _circleMarker = [];
  LatLng _currentLatlang = LatLng(0.0, 0.0);
  bool _isClicked = false;

  LatLng get center => _center;
  MapController get mapController => _mapController;
  List<Marker> get marker => _marker;
  List<CircleMarker> get circleMarker => _circleMarker;
  LatLng get currentLatlang => _currentLatlang;

  makeCIrcle(LatLng positition, CustomMarkerModel? model) {
    if (_isClicked) {
      _circleMarker.removeLast();
      _marker.removeLast();
    }
    _isClicked = true;
    _currentLatlang = positition;
    _circleMarker.add(
      CircleMarker(
        color: Colors.blue.withOpacity(0.5),
        borderStrokeWidth: 1,
        useRadiusInMeter: true,
        point: positition,
        radius: 250,
      ),
    );
    _marker.add(
      Marker(
        width: 50.0,
        height: 50.0,
        point: positition,
        builder: (ctx) => IconButton(
            onPressed: () {
              if (model != null) {
                BottomSheetMap.bottomSheet(ctx, model);
              }
            },
            icon: const Icon(Icons.keyboard_double_arrow_down_rounded)),
      ),
    );
    notifyListeners();
  }

  initData() async {
    List<CustomMarkerModel> data = await Services().getData();
    for (var item in data) {
      _circleMarker.add(
        CircleMarker(
          color: Colors.green.withOpacity(0.5),
          borderStrokeWidth: 2,
          useRadiusInMeter: true,
          point: LatLng(item.lat, item.lang),
          radius: 250,
        ),
      );
      _marker.add(Marker(
        width: 50.0,
        height: 50.0,
        point: LatLng(item.lat, item.lang),
        builder: (ctx) => IconButton(
            onPressed: () {
              BottomSheetMap.bottomSheet(ctx, item);
            },
            icon: const Icon(Icons.keyboard_double_arrow_down_rounded)),
      ));
    }
  }
}
