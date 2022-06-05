// ignore_for_file: unused_element, prefer_const_literals_to_create_immutables

import 'package:elektronik_disposisi_management/model/disposisi_model.dart';
import 'package:elektronik_disposisi_management/style/style_for_text.dart';
import 'package:flutter/material.dart';

abstract class BottomSheetMap {
  static bottomSheet(BuildContext context, DisposisiModel disposisi) {
    showModalBottomSheet<void>(
        isDismissible: false,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(50), topRight: Radius.circular(50)),
        ),
        context: context,
        builder: (BuildContext context) {
          disposisi.petugas as List;
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
                    "ATASAN : ${disposisi.atasan}",
                    style: StyleForText.smallStyle,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text("PELAKSANA :", style: StyleForText.smallStyle),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: disposisi.petugas.length,
                    itemBuilder: (context, index) {
                      if (disposisi.petugas.isNotEmpty) {
                        return Center(child: Text(disposisi.petugas[index]));
                      } else {
                        return const Center(child: Text("loading"));
                      }
                    },
                  ),
                  const Text("POSISI :", style: StyleForText.smallStyle),
                  Text("Lat : ${disposisi.lat}"),
                  Text("Lat : ${disposisi.lang}"),
                ],
              ),
            ),
          );
        });
  }
}
