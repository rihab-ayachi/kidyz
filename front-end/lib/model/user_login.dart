class User {
  String? id;
  late final String? firstName;
  late final String? lastName;
  String email;
  //late final String password;
  late final String token;
  late final int allowedsensors;
  late bool lisence_activated;
  late DateTime lisence_enddate;

  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.token,
    // required this.allowedsensors,
    // required this.lisence_activated,
    // required this.lisence_enddate,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      firstName: json['nom'],
      lastName: json['prenom'],
      email: json['email'],
      token: json['accessToken'],
    );
  }
}
