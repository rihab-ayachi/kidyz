import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static Future saveToken(
      String id, String nom, String prenom, String email) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString("id", id);
    sharedPreferences.setString("nom", nom);
    sharedPreferences.setString("prenom", prenom);
    sharedPreferences.setString("email", email);
    print(sharedPreferences.getString("id"));
    print(sharedPreferences.getString("nom"));
    print(sharedPreferences.getString("prenom"));
    print(sharedPreferences.getString("email"));
  }

  /*static Future<String> getToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var id = sharedPreferences.getString("id");
    return id;
  }*/

}
