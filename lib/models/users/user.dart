class User {
  final int id;
  final String email;
  final String first_name;
  final String last_name;
  final String avatar;

  User({
    required this.id,
    required this.email,
    required this.first_name,
    required this.last_name,
    required this.avatar,
  });

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
        id: map["id"],
        email: map["email"],
        first_name: map["first_name"],
        last_name: map["last_name"],
        avatar: map["avatar"]);
  }
}
