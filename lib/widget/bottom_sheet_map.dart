// ignore_for_file: unused_element, prefer_const_literals_to_create_immutables

import 'package:elektronik_disposisi_management/model/cutom_marker_model.dart';
import 'package:elektronik_disposisi_management/style/style_for_text.dart';
import 'package:flutter/material.dart';

abstract class BottomSheetMap {
  static bottomSheet(BuildContext context, CustomMarkerModel model) {
    showModalBottomSheet<void>(
        isDismissible: false,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(50), topRight: Radius.circular(50)),
        ),
        context: context,
        builder: (BuildContext context) {
          // ignore: sized_box_for_whitespace
          return Padding(
            padding: const EdgeInsets.all(15.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const Text('Sedang Bertugas', style: StyleForText.smallStyle),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    "ATASAN : ${model.atasan}",
                    style: StyleForText.smallStyle,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text("PELAKSANA :", style: StyleForText.smallStyle),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: model.pelaksana.length,
                    itemBuilder: (context, index) {
                      if (model.pelaksana.isNotEmpty) {
                        return Center(child: Text(model.pelaksana[index]));
                      } else {
                        return const Center(child: Text("loading"));
                      }
                    },
                  ),
                  const Text("POSISI :", style: StyleForText.smallStyle),
                  Text("Lat : ${model.lat}"),
                  Text("Lat : ${model.lang}"),
                ],
              ),
            ),
          );
        });
  }
}
