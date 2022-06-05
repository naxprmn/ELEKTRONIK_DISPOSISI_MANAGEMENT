import 'package:elektronik_disposisi_management/model/disposisi_model.dart';
import 'package:elektronik_disposisi_management/model/user_model.dart';
import 'package:elektronik_disposisi_management/repositories/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';

final petugasProvider = FutureProvider<List<User>>((ref) async {
  final user = ref.read(databaseProvider).getUser();
  return user;
});

final disposisiProvider = FutureProvider<List<DisposisiModel>>((ref) async {
  final disposisi = ref.read(databaseProvider).getDisposisi();
  return disposisi;
});

final centerLocationProvider = Provider<LatLng>((ref) => LatLng(-7.47717, 110.21817));

final isClickedProvider = StateProvider<bool>((ref) => false);
