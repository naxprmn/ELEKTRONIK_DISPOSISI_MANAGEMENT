import 'package:elektronik_disposisi_management/model/user_model.dart';
import 'package:elektronik_disposisi_management/repositories/services.dart';
import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  List<User> _listAnggota = [];
  List<User> get listAnggota => _listAnggota;

  getAllUser() async {
    List<User> response = await Services().getUser();
    _listAnggota = response;
  }
}
