import 'package:elektronik_disposisi_management/provider/map_provider.dart';
import 'package:elektronik_disposisi_management/style/style_for_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:provider/provider.dart';

class MapPage extends StatelessWidget {
  const MapPage({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Consumer<MapProvider>(
      builder: (context, consume, child) {
        return FlutterMap(
            options: MapOptions(
                center: consume.center,
                zoom: 14.25,
                minZoom: 13,
                onTap: (_, latLng) {
                  consume.makeCIrcle(latLng, null);
                }),
            layers: [
              CircleLayerOptions(circles: consume.circleMarker),
              MarkerLayerOptions(markers: consume.marker),
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
