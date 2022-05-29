// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class User {
  int id;
  String nama;
  User({
    required this.id,
    required this.nama,
  });

  User copyWith({
    int? id,
    String? nama,
  }) {
    return User(
      id: id ?? this.id,
      nama: nama ?? this.nama,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'nama': nama,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] as int,
      nama: map['nama'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'User(id: $id, nama: $nama)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is User && other.id == id && other.nama == nama;
  }

  @override
  int get hashCode => id.hashCode ^ nama.hashCode;
}
