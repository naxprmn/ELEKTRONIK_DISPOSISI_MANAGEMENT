// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class DisposisiModel {
  int id;
  String atasan;
  String petugas;
  double lat;
  double lang;
  bool isCompleted;

  DisposisiModel({
    required this.id,
    required this.atasan,
    required this.petugas,
    required this.lat,
    required this.lang,
    required this.isCompleted,
  });

  DisposisiModel copyWith({
    int? id,
    String? atasan,
    String? petugas,
    double? lat,
    double? lang,
    bool? isCompleted,
  }) {
    return DisposisiModel(
      id: id ?? this.id,
      atasan: atasan ?? this.atasan,
      petugas: petugas ?? this.petugas,
      lat: lat ?? this.lat,
      lang: lang ?? this.lang,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'atasan': atasan,
      'petugas': petugas,
      'lat': lat,
      'lang': lang,
      'isCompleted': isCompleted,
    };
  }

  factory DisposisiModel.fromMap(Map<String, dynamic> map) {
    return DisposisiModel(
      id: map['id'] as int,
      atasan: map['atasan'] as String,
      petugas: map['petugas'] as String,
      lat: map['lat'] as double,
      lang: map['lang'] as double,
      isCompleted: map['isCompleted'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory DisposisiModel.fromJson(String source) => DisposisiModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'DisposisiModel(id: $id, atasan: $atasan, petugas: $petugas, lat: $lat, lang: $lang, isCompleted: $isCompleted)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is DisposisiModel &&
        other.id == id &&
        other.atasan == atasan &&
        other.petugas == petugas &&
        other.lat == lat &&
        other.lang == lang &&
        other.isCompleted == isCompleted;
  }

  @override
  int get hashCode {
    return id.hashCode ^ atasan.hashCode ^ petugas.hashCode ^ lat.hashCode ^ lang.hashCode ^ isCompleted.hashCode;
  }
}
