import 'package:elektronik_disposisi_management/providers/general_provider.dart';
import 'package:elektronik_disposisi_management/providers/map_provider.dart';
import 'package:elektronik_disposisi_management/style/style_for_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';

import '../model/map_model.dart';

class MapPage extends StatelessWidget {
  const MapPage({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        return ref.watch(disposisiProvider).when(data: (data) {
          List<MapModel> marker = [];
          for (var item in data) {
            marker.add(MapModel(
              marker: Marker(
                width: 50.0,
                height: 50.0,
                point: LatLng(item.lat, item.lang),
                builder: (ctx) =>
                    IconButton(onPressed: () {}, icon: const Icon(Icons.keyboard_double_arrow_down_rounded)),
              ),
              circle: CircleMarker(
                color: Colors.blue.withOpacity(0.5),
                borderStrokeWidth: 1,
                useRadiusInMeter: true,
                point: LatLng(item.lat, item.lang),
                radius: 250,
              ),
            ));
          }
          ref.read(mapController.notifier).initData(marker);
          return Consumer(
            builder: (context, ref, child) {
              List<Marker> marker = [];
              List<CircleMarker> circleMarker = [];
              final layerprovider = ref.watch(mapController);
              for (var item in layerprovider) {
                circleMarker.add(item.circle);
                marker.add(item.marker);
              }
              return FlutterMap(
                  options: MapOptions(
                      center: ref.watch(centerLocationProvider),
                      zoom: 14.25,
                      minZoom: 13,
                      onTap: (_, latLng) {
                        ref.read(mapController.notifier).addMarker(latLng);
                        ref.read(isClickedProvider.notifier).update((state) => true);
                      }),
                  layers: [
                    CircleLayerOptions(circles: circleMarker),
                    MarkerLayerOptions(markers: marker),
                  ],
                  children: [
                    TileLayerWidget(
                        options: TileLayerOptions(
                            urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                            subdomains: ['a', 'b', 'c'],
                            attributionBuilder: (_) {
                              return const Text(
                                "@MPM STUDIO",
                                style: StyleForText.smallStyle,
                              );
                            }))
                  ]);
            },
          );
        }, error: (error, stacktrace) {
          return Center(child: Text(error.toString()));
        }, loading: () {
          return const Center(
            child: CircularProgressIndicator(),
          );
        });
      },
    );
  }
}
