// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class CustomMarkerModel {
  int id;
  String atasan;
  List<String> pelaksana;
  double lat;
  double lang;

  CustomMarkerModel({
    required this.id,
    required this.atasan,
    required this.pelaksana,
    required this.lat,
    required this.lang,
  });

  CustomMarkerModel copyWith({
    int? id,
    String? atasan,
    List<String>? pelaksana,
    double? lat,
    double? lang,
  }) {
    return CustomMarkerModel(
      id: id ?? this.id,
      atasan: atasan ?? this.atasan,
      pelaksana: pelaksana ?? this.pelaksana,
      lat: lat ?? this.lat,
      lang: lang ?? this.lang,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'atasan': atasan,
      'pelaksana': pelaksana,
      'lat': lat,
      'lang': lang,
    };
  }

  factory CustomMarkerModel.fromMap(Map<String, dynamic> map) {
    return CustomMarkerModel(
      id: map['id'] as int,
      atasan: map['atasan'] as String,
      pelaksana: List<String>.from((map['pelaksana'] as List<String>)),
      lat: map['lat'] as double,
      lang: map['lang'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory CustomMarkerModel.fromJson(String source) =>
      CustomMarkerModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CustomMarkerModel(id: $id, atasan: $atasan, pelaksana: $pelaksana, lat: $lat, lang: $lang)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CustomMarkerModel &&
        other.id == id &&
        other.atasan == atasan &&
        listEquals(other.pelaksana, pelaksana) &&
        other.lat == lat &&
        other.lang == lang;
  }

  @override
  int get hashCode {
    return id.hashCode ^ atasan.hashCode ^ pelaksana.hashCode ^ lat.hashCode ^ lang.hashCode;
  }
}
