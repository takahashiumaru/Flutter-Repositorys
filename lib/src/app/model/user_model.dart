class User {
  User({
    required this.id,
    required this.name,
    required this.role,
    required this.level,
    required this.nip,
  });
  final int id;
  final String name;
  final String role;
  final String level;
  final String nip;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'role': role,
      'level': level,
      'nip': nip,
    };
  }

  User fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as int,
      name: json['name'] as String,
      role: json['role'] as String,
      level: json['level'] as String,
      nip: json['nip'] as String,
    );
  }
}
