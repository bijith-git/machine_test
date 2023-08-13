class UserModel {
  String name;
  String email;
  String dob;
  String profilePic;
  String createdAt;

  UserModel({
    required this.name,
    required this.email,
    required this.dob,
    required this.profilePic,
    required this.createdAt,
  });

  // from map
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      dob: map['dob'] ?? '',
      createdAt: map['createdAt'] ?? '',
      profilePic: map['profilePic'] ?? '',
    );
  }

  // to map
  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "email": email,
      'dob': dob,
      "profilePic": profilePic,
      "createdAt": createdAt,
    };
  }
}
