class AuthedUser {
  final String id;
  final String name;
  final String email;

  const AuthedUser({required this.id, required this.name, required this.email});

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'name': this.name,
      'email': this.email,
    };
  }

  factory AuthedUser.fromMap(Map<String, dynamic> map) {
    return AuthedUser(
      id: map['id'] as String,
      name: map['name'] as String,
      email: map['email'] as String,
    );
  }

  @override
  String toString() {
    return 'AuthedUser{id: $id, name: $name, email: $email}';
  }
}
