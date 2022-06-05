import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../model/user_model.dart';
import '../repositories/services.dart';

final petugasProvider = StateNotifierProvider<PetugasProvider, AsyncValue<List<User>>>(
  (ref) => PetugasProvider(ref.read),
);

class PetugasProvider extends StateNotifier<AsyncValue<List<User>>> {
  PetugasProvider(this._read) : super(const AsyncLoading()) {
    _getAllUser();
  }
  final Reader _read;

  _getAllUser() async {
    List<User> response = await _read(databaseProvider).getUser();
    return response;
  }
}

// class PetugasProvider extends StateNotifier<<List<User>>>() {
//   List<User> _listAnggota = [];

//   getAllUser() async {
//     List<User> response = await Services().getUser();
//     _listAnggota = response;
//   }
// }
