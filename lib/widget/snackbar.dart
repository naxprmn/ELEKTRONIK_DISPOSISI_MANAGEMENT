import 'package:elektronik_disposisi_management/view/shared.dart';
import 'package:flutter/material.dart';

abstract class ShowInSnacbar {
  static build(String value, Color color) {
    rootScaffoldMessengerKey.currentState!.removeCurrentSnackBar();
    rootScaffoldMessengerKey.currentState!.showSnackBar(SnackBar(
      content: Text(
        value,
        textAlign: TextAlign.center,
        style: const TextStyle(color: Colors.white, fontSize: 16.0, fontFamily: "WorkSansSemiBold"),
      ),
      backgroundColor: color,
      duration: const Duration(seconds: 3),
    ));
  }
}
