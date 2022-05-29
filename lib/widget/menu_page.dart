import 'package:elektronik_disposisi_management/provider/map_provider.dart';
import 'package:elektronik_disposisi_management/widget/custom_selectable_text.dart';
import 'package:elektronik_disposisi_management/widget/form_assesment.dart';
import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:provider/provider.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<MapProvider>(
      builder: (context, consume, child) {
        if (consume.currentLatlang != LatLng(0.0, 0.0)) {
          return Column(
            children: [CustomSelectableText.text(consume.currentLatlang.toString()), const FormAssesment()],
          );
        }
        return const Center(child: Text("Silahkan Pilih Koordinat"));
      },
    );
  }
}
