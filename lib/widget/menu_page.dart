import 'package:elektronik_disposisi_management/providers/general_provider.dart';
import 'package:elektronik_disposisi_management/widget/custom_selectable_text.dart';
import 'package:elektronik_disposisi_management/widget/form_assesment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        if (ref.watch(isClickedProvider)) {
          return Column(
            children: [CustomSelectableText.text("consume.currentLatlang.toString()"), const FormAssesment()],
          );
        }
        return const Center(child: Text("Silahkan Pilih Koordinat"));
      },
    );
  }
}
