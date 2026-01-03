final class User {
  final String id;
  final String email;
  final String name;
  final String plan;
  final bool isBlocked;

  const User({
    required this.id,
    required this.email,
    required this.name,
    required this.plan,
    required this.isBlocked,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as String,
      email: json['email'] as String,
      name: (json['name'] ?? '') as String,
      plan: json['plan'] as String,
      isBlocked: json['isBlocked'] as bool? ?? false,
    );
  }
}
