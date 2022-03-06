class User{
  late String name;
  late String username;
  late String password;

//<editor-fold desc="Data Methods">

  User({
    required this.name,
    required this.username,
    required this.password,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is User &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          username == other.username &&
          password == other.password);

  @override
  int get hashCode => name.hashCode ^ username.hashCode ^ password.hashCode;

  @override
  String toString() {
    return 'User{' +
        ' name: $name,' +
        ' username: $username,' +
        ' password: $password,' +
        '}';
  }

  User copyWith({
    String? name,
    String? username,
    String? password,
  }) {
    return User(
      name: name ?? this.name,
      username: username ?? this.username,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': this.name,
      'username': this.username,
      'password': this.password,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      name: map['name'] as String,
      username: map['username'] as String,
      password: map['password'] as String,
    );
  }

//</editor-fold>
}