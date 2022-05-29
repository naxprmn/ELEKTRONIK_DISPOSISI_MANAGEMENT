import 'package:elektronik_disposisi_management/model/cutom_marker_model.dart';
import 'package:elektronik_disposisi_management/model/user_model.dart';

class Services {
  Future<List<CustomMarkerModel>> getData() async {
    Future.delayed(const Duration(seconds: 2));
    return [
      CustomMarkerModel(id: 1, atasan: 'Test', pelaksana: ['satu', 'dua'], lat: -7.469656, lang: 110.221183),
      CustomMarkerModel(id: 2, atasan: 'Test dua', pelaksana: ['tiga', 'empat'], lat: -7.486187, lang: 110.217863)
    ];
  }

  Future<List<User>> getUser() async {
    Future.delayed(const Duration(seconds: 2));
    return [
      User(id: 1, nama: 'anggota 1'),
      User(id: 1, nama: 'anggota 2'),
      User(id: 1, nama: 'anggota 3'),
      User(id: 1, nama: 'anggota 4'),
    ];
  }
}
