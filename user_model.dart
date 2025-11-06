class UserModel {
  final int? id;
  final String firstName;
  final String lastName;
  final String email;
  final String password; // stored as hashed

  UserModel({this.id, required this.firstName, required this.lastName, required this.email, required this.password});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'password': password,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> m) {
    return UserModel(
      id: m['id'] as int?,
      firstName: m['firstName'] ?? '',
      lastName: m['lastName'] ?? '',
      email: m['email'] ?? '',
      password: m['password'] ?? '',
    );
  }
}
