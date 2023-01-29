class Users {
  Users({
    required this.id,
    required this.nip,
    required this.name,
    required this.role,
    required this.joinDate,
    required this.email,
    required this.phone,
  });

  factory Users.fromJson(Map<String, dynamic> json) {
    return Users(
      id: json['id'] as int,
      nip: json['nip'] as String,
      name: json['name'] as String,
      role: json['role'] as String,
      joinDate: json['join_date'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
    );
  }
  final int id;
  final String nip;
  final String name;
  final String role;
  final String joinDate;
  final String email;
  final String phone;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nip': nip,
      'name': name,
      'role': role,
      'join_date': joinDate,
      'email': email,
      'phone': phone,
    };
  }
}
