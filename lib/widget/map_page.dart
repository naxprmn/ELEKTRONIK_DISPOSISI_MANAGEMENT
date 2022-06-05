import 'package:elektronik_disposisi_management/providers/general_provider.dart';
import 'package:elektronik_disposisi_management/providers/map_provider.dart';
import 'package:elektronik_disposisi_management/style/style_for_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MapPage extends StatelessWidget {
  const MapPage({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
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
  }
}
