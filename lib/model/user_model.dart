// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class User {
  int id;
  String name;
  String uuid;
  String email;
  int officeId;
  bool isAvailable;
  User({
    required this.id,
    required this.name,
    required this.uuid,
    required this.email,
    required this.officeId,
    required this.isAvailable,
  });

  User copyWith({
    int? id,
    String? name,
    String? uuid,
    String? email,
    int? officeId,
    bool? isAvailable,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      uuid: uuid ?? this.uuid,
      email: email ?? this.email,
      officeId: officeId ?? this.officeId,
      isAvailable: isAvailable ?? this.isAvailable,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'uuid': uuid,
      'email': email,
      'officeId': officeId,
      'isAvailable': isAvailable,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] as int,
      name: map['name'] as String,
      uuid: map['uuid'] as String,
      email: map['email'] as String,
      officeId: map['officeId'] as int,
      isAvailable: map['isAvailable'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'User(id: $id, name: $name, uuid: $uuid, email: $email, officeId: $officeId, isAvailable: $isAvailable)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is User &&
        other.id == id &&
        other.name == name &&
        other.uuid == uuid &&
        other.email == email &&
        other.officeId == officeId &&
        other.isAvailable == isAvailable;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        uuid.hashCode ^
        email.hashCode ^
        officeId.hashCode ^
        isAvailable.hashCode;
  }
}
