class User {
  final String? id;
  final String? nom;
  final String? prenom;
  final String? email;
  final String? password;

  User(
      {required this.id,
      required this.nom,
      required this.prenom,
      required this.email,
      required this.password});
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['_id'],
      nom: json['nom'],
      prenom: json['prenom'],
      email: json['email'],
      password: json['password'],
    );
  }
}
